using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{
    public class MUSTERI
    {
        public virtual int? MU_ID { get;  set; }
        public virtual string MU_AD_SOYAD { get; set; }
        public virtual string MU_SIRKET { get; set; }
        public virtual string MU_KULLANICI_ADI { get; set; }
        public virtual string MU_TELEFON { get; set; }
        public virtual string MU_ADRES { get; set; }
        public virtual string MU_EMAIL { get; set; }
        public virtual string MU_SIFRE { get; set; } 
    }

    public sealed class MUSTERI_MAP : ClassMap<MUSTERI>
    {
        public MUSTERI_MAP()
        {
            Id(x => x.MU_ID).GeneratedBy.TriggerIdentity();
            Map(x => x.MU_AD_SOYAD);
            Map(x => x.MU_SIRKET);
            Map(x => x.MU_KULLANICI_ADI);
            Map(x => x.MU_TELEFON);
            Map(x => x.MU_ADRES);
            Map(x => x.MU_EMAIL);
            Map(x => x.MU_SIFRE); 
        }
    }
}
