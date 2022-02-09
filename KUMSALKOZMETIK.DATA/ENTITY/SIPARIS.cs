using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{
    public class SIPARIS
    {
        public virtual int? SP_ID { get; set; }
        public virtual int? SP_MUSTERI { get; set; }
        public virtual int? SP_TOPLAM_URUN { get; set; }
        public virtual decimal? SP_TOPLAM_TUTAR { get; set; }
        public virtual DateTime SP_CREATED { get; set; }
        public virtual string SP_DURUM { get; set; } 
    }

    public sealed class SIPARIS_MAP : ClassMap<SIPARIS>
    {
        public SIPARIS_MAP()
        {
            Id(x => x.SP_ID).GeneratedBy.TriggerIdentity();
            Map(x => x.SP_MUSTERI);
            Map(x => x.SP_TOPLAM_URUN);
            Map(x => x.SP_TOPLAM_TUTAR);
            Map(x => x.SP_CREATED);
            Map(x => x.SP_DURUM);
        }
    }
}
