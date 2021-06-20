using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using Logger;

namespace TestUngDung.Common
{
    public class Common
    {
        /// <summary>
        /// Ghi log lỗi và quy trình
        /// Input: sPage(Tên của trang cần Log), string sFunction(Tên của hàm cần Log), string sMessage(Nội dung Log)
        /// </summary>
        public static void WriteLog(string sPage, string sFunction, string sMessage)
        {
            try
            {
                string LogPath = HttpContext.Current.Server.MapPath("~/LogInfo");
                if (!System.IO.Directory.Exists(LogPath))
                {
                    System.IO.Directory.CreateDirectory(LogPath);
                }
                CLogger TestLogger = new CLogger();
                TestLogger.Initialize(LogPath, "SHOP.log", 2);
                TestLogger.LogInformation(sPage, sFunction, sMessage);
                TestLogger.Terminate();
            }
            catch (Exception)
            {
            }
        }

        /// <summary>
        /// Sử dụng để Convert Chữ Số Có Dấu sang Số Không Dấu có gạch ở giữa(Dùng ASCII)
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static string ConvertToUnSign(string text)
        {

            for (int i = 33; i < 48; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }

            for (int i = 58; i < 65; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }

            for (int i = 91; i < 97; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }

            for (int i = 123; i < 127; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }

            text = text.Replace(" ", "-");
            text = text.Replace("\"", "'");
            Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");

            string strFormD = text.Normalize(System.Text.NormalizationForm.FormD);

            return regex.Replace(strFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');

        }
    }
}