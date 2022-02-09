using KUMSALKOZMETIK.DATA.ENTITY;
using KUMSALKOZMETIK.DATA.REPOSITORY;
using Newtonsoft.Json;
using NHibernate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace KUMSALKOZMETIK.UI.WEB
{
    public partial class Urunler : System.Web.UI.Page
    {
        [WebMethod]
        public static string getUrun(string shortcolon, string shorttype, int[] filterMarka, int[] filterustkategori, int[] filterkategori, int[] filteraltkategori, string filterall, int gosterilecek, int sayfa, decimal? maxfiyat, decimal? minfiyat)
        {
            try
            {
                IList<VIEW_URUN> source = new RVIEW_URUN().GetData(shortcolon, shorttype, filterMarka, filterustkategori, filterkategori, filteraltkategori, filterall, false, maxfiyat, minfiyat);

                List<VIEW_URUN> list2 = source.Skip<VIEW_URUN>(((sayfa - 1) * gosterilecek)).Take<VIEW_URUN>(gosterilecek).ToList<VIEW_URUN>();

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = list2,
                    total = source.Count<VIEW_URUN>()
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Urunler yüklenirken hata oluştu.",
                    status = 500,
                    data = "Urunler yüklenirken hata oluştu."
                });
            }
        }


        [WebMethod]
        public static string addCost(int? UrunId, string UrunAdi, int Adet, decimal Fiyat)
        {
            try
            {
                SEPETENTITY sepet = new SEPETENTITY
                {
                    UrunId = UrunId,
                    UrunAdi = UrunAdi,
                    UrunFiyat = Fiyat,
                    UrunAdet = new int?(Adet)
                };
                new RSESSION().AddCost(sepet);

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RSESSION().GetSession().Sepet
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Categoriler yüklenirken hata oluştu.",
                    status = 500,
                    data = "Categoriler yüklenirken hata oluştu."
                });
            }
        }


    }
}