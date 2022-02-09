using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{
    public class URUN
    {
        public virtual int? UR_ID { get; set; }
        public virtual string UR_AD { get; set; }
        public virtual string UR_URUN_DETAY { get; set; }
        public virtual int? UR_MARKA { get; set; }
        public virtual int? UR_KATEGORI { get; set; }
        public virtual decimal? UR_FIYAT { get; set; }
        public virtual decimal? UR_INDIRIM { get; set; }
        public virtual string UR_YENI { get; set; }
        public virtual int? UR_STOK { get; set; }
        public virtual string UR_GRAMAJ { get; set; }
        public virtual string UR_RESIM_URL { get; set; }
        public virtual int? UR_INDIRIM_YUZDE { get; set; }
        public virtual decimal? UR_FIYAT_INDIRIMLI { get; set; }

    }
    public sealed class URUN_MAP : ClassMap<URUN>
    {
        public URUN_MAP()
        {
            Id(x => x.UR_ID).GeneratedBy.TriggerIdentity();
            Map(x => x.UR_AD);
            Map(x => x.UR_URUN_DETAY);
            Map(x => x.UR_MARKA);
            Map(x => x.UR_KATEGORI);
            Map(x => x.UR_FIYAT);
            Map(x => x.UR_INDIRIM);
            Map(x => x.UR_YENI);
            Map(x => x.UR_STOK);
            Map(x => x.UR_GRAMAJ);
            Map(x => x.UR_RESIM_URL);
            Map(x => x.UR_INDIRIM_YUZDE);
            Map(x => x.UR_FIYAT_INDIRIMLI);
        }
    }
}
