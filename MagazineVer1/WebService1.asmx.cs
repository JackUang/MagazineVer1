using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace MagazineVer1
{
    /// <summary>
    ///WebService1 的摘要描述
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
     [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        string connStr = @"Data Source=MANDY-PC\SQLEXPRESS;Initial Catalog=POP;Integrated Security=True";

        //下面這行是原本的，我現在要把它改成是MVC的
        //string connStr = @"Data Source=MANDY-PC\SQLEXPRESS;Initial Catalog=POP_Advertisements;User Id=sa;Password=1234;";
        //string connStr = @"Server = MANDY-PC\SQLEXPRESS; Database=POP_Advertisements; User Id=sa;Password=1234;";
        //string connStr = "Server = WIN-3N351T14N6N\\SQLEXPRESS; Database = Test; User Id = sa;Password = Rfid3603;";
        [WebMethod]
        public string GetData(string SqlStr)
        {
            DataTable dt = new DataTable();
            SqlConnection dbconn = new SqlConnection(connStr);
            dbconn.Open();
            SqlCommand dbcmd = new SqlCommand(SqlStr, dbconn);
            SqlDataAdapter da = new SqlDataAdapter(dbcmd);
            da.Fill(dt);
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            dbconn.Close();
            return serializer.Serialize(rows);  //JSON Format
        }
        
    }
}
