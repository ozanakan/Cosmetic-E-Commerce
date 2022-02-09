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
    public partial class AdminPanelKategoriler : System.Web.UI.Page
    {
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
                    message = "Marka yüklenirken hata oluştu.",
                    status = 500,
                    data = "Marka yüklenirken hata oluştu."
                });
            }
        }
        [WebMethod]
        public static string saveMarka(int? _MA_ID, string _MA_CODE)
        {
            try
            {
                new RMARKA().SaveOrUpdate(new MARKA() { MA_ID = _MA_ID, MA_CODE = _MA_CODE });

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
                    message = "Marka yüklenirken hata oluştu.",
                    status = 500,
                    data = "Marka yüklenirken hata oluştu."
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
                    message = "Marka yüklenirken hata oluştu.",
                    status = 500,
                    data = "Marka yüklenirken hata oluştu."
                });
            }
        }









        [WebMethod]
        public static string getUstKategori()
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RKATEGORI_UST().GetAll()
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
        public static string getAltKategori()
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RKATEGORI_ALT().GetAll()
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
        public static string deleteKategoriUst(int id)
        {
            try
            {
                var data = new RKATEGORI_UST().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("UK_ID",id)
                    });

                if (data != null)
                    new RKATEGORI_UST().Delete(data);


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
        public static string deleteKategoriAlt(int id)
        {
            try
            {
                var data = new RKATEGORI_ALT().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("AK_ID",id)
                    });

                if (data != null)
                    new RKATEGORI_ALT().Delete(data);


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
        public static string saveKategoriUst(int? _UK_ID, string _UK_CODE)
        {
            try
            {
                new RKATEGORI_UST().SaveOrUpdate(new KATEGORI_UST() { UK_ID = _UK_ID, UK_CODE = _UK_CODE });

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
        public static string saveKategori(int? _KA_ID, int? _UK_ID, string _KA_CODE)
        {
            try
            {
                new RKATEGORI().SaveOrUpdate(new KATEGORI() { KA_ID = _KA_ID, UK_ID = _UK_ID, KA_CODE = _KA_CODE });

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
        public static string saveKategoriAlt(int? _AK_ID, int? _KA_ID, string _AK_CODE)
        {
            try
            {
                new RKATEGORI_ALT().SaveOrUpdate(new KATEGORI_ALT() { AK_ID = _AK_ID, KA_ID = _KA_ID, AK_CODE = _AK_CODE });

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