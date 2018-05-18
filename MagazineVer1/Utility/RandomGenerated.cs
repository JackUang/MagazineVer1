using System;
using System.Text;

namespace MagazineVer1.Utility
{
    public class RandomGenerated
    {
        /// <summary>
        /// 亂數產生字串
        /// </summary>
        /// <param name="length">產生字串長度</param>
        /// <returns>亂數產生字串結果</returns>
        public string RandomString(int length)
        {
            var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            var next = new Random();
            var builder = new StringBuilder();
            for (var i = 0; i < length; i++)
            {
                builder.Append(str[next.Next(0, str.Length)]);
            }
            return builder.ToString();
        }
    }
}