using KUMSALKOZMETIK.DATA.ENTITY;
using KUMSALKOZMETIK.DATA.REPOSITORY;
using Newtonsoft.Json;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KUMSALKOZMETIK.UI.WEB
{
    public partial class sepetim : System.Web.UI.Page
    {
        [WebMethod]
        public static string getSepet()
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RSESSION().GetSession()
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Sepetteki ürünler getirilirken hata oluştu.",
                    status = 500,
                    data = "Sepetteki ürünler getirilirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string RemoveCost(int? UrunId)
        {
            try
            {
                SEPETENTITY sepet = new SEPETENTITY
                {
                    UrunId = UrunId
                };
                new RSESSION().DeleteItemFromCost(sepet);
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Urun sepetten \x00e7ıkartılırken hata oluştu.",
                    status = 500,
                    data = "Urun sepetten \x00e7ıkartılırken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string SepetOnay(IList<SEPETENTITY> sepet)
        {
            try
            {
                SESSIONENTITY session = new RSESSION().GetSession();

                if (session.Sepet.Count == 0)
                {
                    return JsonConvert.SerializeObject(new
                    {
                        message = "Sepetinizde ürün bulunmamakta.",
                        status = 500,
                        data = "Sepetinizde ürün bulunmamakta."
                    });
                }

                if (session.Musteri == null)
                {
                    return JsonConvert.SerializeObject(new
                    {
                        message = "Completed",
                        status = 300
                    });
                }

                SIPARIS data = new SIPARIS
                {
                    SP_MUSTERI = session.Musteri.MU_ID,
                    SP_DURUM = "1",
                    SP_TOPLAM_TUTAR = session.Sepet.Sum(x => (x.UrunFiyat * x.UrunAdet)),
                    SP_TOPLAM_URUN = session.Sepet.Sum(x => x.UrunAdet),
                    SP_CREATED = DateTime.Now
                };

                new RSIPARIS().Save(data);

                var alldata = new RSIPARIS().GetAll(new List<ICriterion>()
                    {
                        Restrictions.Eq("SP_MUSTERI",session.Musteri.MU_ID)
                    }, null, "desc", "SP_CREATED", 1, 1000);

                foreach (SEPETENTITY entity2 in session.Sepet)
                {
                    new RSIPARIS_DETAY().Save(new SIPARIS_DETAY()
                    {
                        SPD_SP_ID = alldata[0].SP_ID,
                        SPD_URUN_ID = entity2.UrunId,
                        SPD_URUN_ADET = entity2.UrunAdet,
                        SPD_URUN_FIYAT = entity2.UrunFiyat,
                        SPD_URUN_TOPLAM = (entity2.UrunFiyat * entity2.UrunAdet),
                        SPD_URUN_NOT = sepet.Where(x => x.UrunId == entity2.UrunId).FirstOrDefault().UrunDetay
                    });
                }

                new RSESSION().EmptCast();

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Sepet onaylanırken hata oluştu.",
                    status = 500,
                    data = "Sepet onaylanırken hata oluştu."
                });
            }
        }
    }
}