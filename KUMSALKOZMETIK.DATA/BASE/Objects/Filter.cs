using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.BASE.Objects
{
    public class Filter
    {
        public enum FilterType
        {
            LIKE,
            EQ,
            NEQ,
            EMPTY,
            NEMPTY
        };

        public string Name { get; set; }
        public object Value { get; set; }
        public FilterType? Type { get; set; }

        public string filterby { get; set; }
        public string filterval { get; set; }
        public string key { get; set; }
        public string val { get; set; }
        public string filteropr { get; set; }
        public string filtervartype { get; set; }
        public string FilterTypes { get; set; }
    }
}
