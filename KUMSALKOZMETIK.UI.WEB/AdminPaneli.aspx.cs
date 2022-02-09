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
    public partial class AdminPaneli : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //object obj2 = HttpContext.Current.Session["Admin"];
                //if (obj2 == null)
                //{
                //    base.Response.Redirect("404.html");
                //}
            }
            catch (Exception)
            {
            }
        }

        [WebMethod]
        public static string deleteKategori(int id)
        {
            try
            {
                var data = new RKATEGORI().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("KA_ID",id)
                    });

                if (data != null)
                    new RKATEGORI().Delete(data);


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
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string deleteMarka(int id)
        {
            try
            {
                var data = new RMARKA().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("MA_ID",id)
                    });

                if (data != null)
                    new RMARKA().Delete(data);


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
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string deleteMusteri(int id)
        {
            try
            {
                var data = new RMUSTERI().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("MU_ID",id)
                    });

                if (data != null)
                    new RMUSTERI().Delete(data);


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
                    message = "Müşteriyi silerken hata oluştu.",
                    status = 500,
                    data = "Müşteriyi silerken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string deleteSiparis(int id)
        {
            try
            {

                var data = new RSIPARIS().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("HZ_ID",id)
                    });

                if (data != null)
                    new RSIPARIS().Delete(data);

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
                    message = "Müşteriyi silerken hata oluştu.",
                    status = 500,
                    data = "Müşteriyi silerken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string deleteUrun(int id)
        {
            try
            {
                var data = new RURUN().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("UR_ID",id)
                    });

                if (data != null)
                    new RURUN().Delete(data);

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
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getKategori()
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RKATEGORI().GetAll()
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getMarka()
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RMARKA().GetAll()
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getMusteri()
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RMUSTERI().GetAll()
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Müşterileri yüklenirken hata oluştu.",
                    status = 500,
                    data = "Müşterileri yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getSiparis(int id)
        {
            try
            {
                var data = new RSIPARIS().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("HZ_ID",id)
                    });

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
                    message = "Müşterileri yüklenirken hata oluştu.",
                    status = 500,
                    data = "Müşterileri yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getSiparisList()
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RSIPARIS().GetAll()
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Siparişler yüklenirken hata oluştu.",
                    status = 500,
                    data = "Siparişler yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getUrun()
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RURUN().GetAll()
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string saveKategori(int? id, string kategori)
        {
            try
            {
                new RKATEGORI().Save(new KATEGORI() { KA_ID = id, KA_CODE = kategori });

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
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string saveMarka(int? id, string marka)
        {
            try
            {
                new RMARKA().Save(new MARKA() { MA_ID = id, MA_CODE = marka });

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
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string saveMusteri(MUSTERI mst)
        {
            try
            {
                new RMUSTERI().Save(mst);

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200
                });
            }
            catch (Exception e)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Müşteriyi eklerken hata oluştu.",
                    status = 500,
                    data = "Müşteriyi eklerken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string saveUrun(URUN urun)
        {
            try
            {
                new RURUN().Save(urun);

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
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }


    }
}