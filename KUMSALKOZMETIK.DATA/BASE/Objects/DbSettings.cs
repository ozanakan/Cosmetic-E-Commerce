using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.BASE.Objects
{
    public static class DbSettings
    {
        public static string Company { get; set; }
        public static string Db_Schema { get; set; } 
        public static string ConnectionString { get; set; }
        public static DateTime ProcessTime { get; set; }
    }
}
