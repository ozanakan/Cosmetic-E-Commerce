using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{  
    public class SEPETENTITY
    {
        public int? UrunId { get; set; }

        public string UrunAdi { get; set; }

        public string UrunDetay { get; set; }

        public int? UrunAdet { get; set; }

        public decimal? UrunFiyat { get; set; }
    }
}
