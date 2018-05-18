using System;
using System.IO;
using System.Security.AccessControl;
using System.Threading.Tasks;

namespace MagazineVer1.Utility
{
    public class DirectoryFileIO
    {
        /// <summary>
        /// 刪除大於天數的檔案
        /// </summary>
        /// <param name="dirPath">資料夾路徑</param>
        /// <returns></returns>
        public async Task DeleteFileAsync(string dirPath)
        {
            try
            {
                if (false == Directory.Exists(dirPath))
                {
                    return;
                }

                string[] files = System.IO.Directory.GetFiles(dirPath, "*.*", System.IO.SearchOption.AllDirectories);
                if (null != files && 0 < files.Length)
                {
                    foreach (string item in files)
                    {
                        DateTime fileDateTime = File.GetCreationTime(item);
                        DateTime dt1 = new DateTime(fileDateTime.Year, fileDateTime.Month, fileDateTime.Day);
                        DateTime dt2 = DateTime.Now;
                        TimeSpan ts = dt2 - dt1;
                        //刪除大於1天的檔案
                        if (1 < ts.Days)
                        {
                            using (FileStream stream = new FileStream(item, FileMode.Truncate, FileAccess.Write, FileShare.Delete, 4096, true))
                            {
                                await stream.FlushAsync();
                                File.Delete(item);
                                stream.Close();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ReadWriteText.WriteText(ex.ToString());
            }
        }

        /// <summary>
        /// 設置資料夾許可權，處理為Everyone擁有權限
        /// </summary>
        /// <param name="foldPath">資料夾路徑</param>
        public void SetFileRole(string foldPath)
        {
            DirectorySecurity fsec = new DirectorySecurity();
            fsec.AddAccessRule(new FileSystemAccessRule("Everyone", FileSystemRights.FullControl,
            InheritanceFlags.ContainerInherit | InheritanceFlags.ObjectInherit, PropagationFlags.None, AccessControlType.Allow));
            System.IO.Directory.SetAccessControl(foldPath, fsec);
        }
    }
}