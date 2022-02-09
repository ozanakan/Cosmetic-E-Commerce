using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{
    public class KATEGORI
    {
        public virtual int? KA_ID { get; set; }
        public virtual int? UK_ID { get; set; }
        public virtual string KA_CODE { get; set; }

    }

    public sealed class KATEGORI_MAP : ClassMap<KATEGORI>
    {
        public KATEGORI_MAP()
        {
            Id(x => x.KA_ID).GeneratedBy.TriggerIdentity(); 
            Map(x => x.UK_ID);
            Map(x => x.KA_CODE);
        }
    }
}
