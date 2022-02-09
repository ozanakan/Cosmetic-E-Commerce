using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{
    public class KATEGORI_UST
    {
        public virtual int? UK_ID { get; set; } 
        public virtual string UK_CODE { get; set; }

    }

    public sealed class KATEGORI_UST_MAP : ClassMap<KATEGORI_UST>
    {
        public KATEGORI_UST_MAP()
        {
            Id(x => x.UK_ID).GeneratedBy.TriggerIdentity(); 
            Map(x => x.UK_CODE);
        }
    }
}
