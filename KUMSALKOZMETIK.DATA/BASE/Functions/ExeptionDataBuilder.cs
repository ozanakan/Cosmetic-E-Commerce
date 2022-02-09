using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace KUMSALKOZMETIK.DATA.BASE.Functions
{
    public class ExeptionDataBuilder<T> //where T : class
    {
        public static string DataBuilder(T data)
        {
            string strdata = "";
            foreach (PropertyInfo pi in data.GetType().GetProperties())
            {
                if (pi.GetValue(data, null) != null)
                    strdata += pi.Name + "=" + pi.GetValue(data, null).ToString() + " ";
            }

            return strdata;
        }
    }
}
