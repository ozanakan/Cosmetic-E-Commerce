using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{
    public class SIPARIS_DETAY
    {
        public virtual int? SPD_ID { get; set; }
        public virtual int? SPD_SP_ID { get; set; }
        public virtual int? SPD_URUN_ID { get; set; }
        public virtual decimal? SPD_URUN_ADET { get; set; }
        public virtual decimal? SPD_URUN_FIYAT { get; set; }
        public virtual decimal? SPD_URUN_TOPLAM { get; set; }
        public virtual string SPD_URUN_NOT { get; set; } 
    }

    public sealed class SIPARIS_DETAY_MAP : ClassMap<SIPARIS_DETAY>
    {
        public SIPARIS_DETAY_MAP()
        {
            Id(x => x.SPD_ID).GeneratedBy.TriggerIdentity();
            Map(x => x.SPD_SP_ID);
            Map(x => x.SPD_URUN_ID);
            Map(x => x.SPD_URUN_ADET);
            Map(x => x.SPD_URUN_FIYAT);
            Map(x => x.SPD_URUN_TOPLAM);
            Map(x => x.SPD_URUN_NOT);
        }
    }
}
