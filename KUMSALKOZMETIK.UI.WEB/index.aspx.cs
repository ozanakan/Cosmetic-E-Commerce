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
    public partial class index : System.Web.UI.Page
    {
        [WebMethod]
        public static string getMenuItem()
        {
            try
            {
                IList<KATEGORI> datakategori = new RKATEGORI().GetAll();
                IList<KATEGORI_ALT> datakategori_alt = new RKATEGORI_ALT().GetAll();
                IList<KATEGORI_UST> datakategori_ust = new RKATEGORI_UST().GetAll();

                IList<MARKA> datamarka = new RMARKA().GetAll();

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    dataktgri = datakategori,
                    dataktgrialt = datakategori_alt,
                    dataktgriust = datakategori_ust,
                    datamarka = datamarka
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Kategoriler yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategoriler yüklenirken hata oluştu."
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

        [WebMethod]
        public static string getCategory()
        {
            try
            {
                IList<KATEGORI> data = new RKATEGORI().GetAll();

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = data
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Kategoriler yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategoriler yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getUstCategory()
        {
            try
            {
                IList<KATEGORI_UST> data = new RKATEGORI_UST().GetAll();

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = data
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Kategoriler yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategoriler yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getAllCategory()
        {
            try
            {

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    dataustkategori = new RKATEGORI_UST().GetAll(),
                    datakategori = new RKATEGORI().GetAll(),
                    dataaltkategori = new RKATEGORI_ALT().GetAll()
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Kategoriler yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategoriler yüklenirken hata oluştu."
                });
            }
        }


        [WebMethod]
        public static string getFirsatUrun()
        {
            try
            {
                var list = new RURUN().GetAll(new List<ICriterion>()
                    {
                        Restrictions.IsNotNull("UR_INDIRIM")
                    });

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = list
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

        [WebMethod]
        public static string getMarka()
        {
            try
            {
                var markaUrunCount = new RMARKA().GetAll();

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = markaUrunCount
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Markalar yüklenirken hata oluştu.",
                    status = 500,
                    data = "Markalar yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getUrun(int[] filterMarka, int[] filterkategori, string filterall, int gosterilecek, int sayfa)
        {
            try
            {
                IList<URUN> source = new RURUN().GetData(filterMarka, filterkategori, filterall, false);

                List<URUN> list2 = source.Skip<URUN>(((sayfa - 1) * gosterilecek)).Take<URUN>(gosterilecek).ToList<URUN>();

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = list2,
                    total = source.Count<URUN>()
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
        public static string LoginAdmin(string user, string pass)
        {
            try
            {
                string str = "";
                if ((user == "123") && (pass == "123"))
                {
                    HttpContext.Current.Session["Admin"] = true;
                    str = str + "AdminPaneli.aspx";
                }
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    url = str
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