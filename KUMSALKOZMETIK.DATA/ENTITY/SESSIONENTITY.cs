using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{ 
    public class SESSIONENTITY
    {
        public MUSTERI Musteri { get; set; }

        public IList<SEPETENTITY> Sepet { get; set; }
    }
}
