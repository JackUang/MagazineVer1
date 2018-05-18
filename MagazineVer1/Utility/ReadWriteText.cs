using System;
using System.IO;
using System.Text;
using System.Web;

namespace MagazineVer1.Utility
{
    public class ReadWriteText
    {
        public static void WriteText(string message)
        {
            StringBuilder msg = new StringBuilder();
            msg.AppendLine(DateTime.Now.ToString());
            msg.AppendLine(message);
            msg.AppendLine("");

            string filePath = HttpContext.Current.Server.MapPath("~/App_Data/Log");

            if (!Directory.Exists(filePath))
            {
                //新增資料夾
                Directory.CreateDirectory(filePath);
            }

            filePath = filePath + "/" + DateTime.Now.ToString("yyyy-MM-dd") + ".txt";

            File.AppendAllText(filePath, msg.ToString());
        }
    }
}