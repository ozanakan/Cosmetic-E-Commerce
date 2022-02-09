using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{
    public class KATEGORI_ALT
    {
        public virtual int? AK_ID { get; set; }
        public virtual int? KA_ID { get; set; }
        public virtual string AK_CODE { get; set; }

    }

    public sealed class KATEGORI_ALT_MAP : ClassMap<KATEGORI_ALT>
    {
        public KATEGORI_ALT_MAP()
        {
            Id(x => x.AK_ID).GeneratedBy.TriggerIdentity(); 
            Map(x => x.KA_ID);
            Map(x => x.AK_CODE);
        }
    }
}
