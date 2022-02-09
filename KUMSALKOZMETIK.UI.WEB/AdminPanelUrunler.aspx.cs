using KUMSALKOZMETIK.DATA.BASE.Objects;
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
    public partial class AdminPanelUrunler : System.Web.UI.Page
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
                    message = "Ürün yüklenirken hata oluştu.",
                    status = 500,
                    data = "Ürün yüklenirken hata oluştu."
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
                    message = "Ürün yüklenirken hata oluştu.",
                    status = 500,
                    data = "Ürün yüklenirken hata oluştu."
                });
            }
        }


        [WebMethod]
        public static string getmaintable(Filter[] filterlst, string shorttype, string shortcolon, int pagenum, Boolean isFirst)
        {
            try
            {
                var _data = new RURUN().GetAll(new List<ICriterion>()
                {
                }, filterlst, shorttype, shortcolon, 1, 10000);

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = _data
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Ürün yüklenirken hata oluştu.",
                    status = 500,
                    data = "Ürün yüklenirken hata oluştu."
                });
            }
        }


        [WebMethod]
        public static string deleteUrun(int? id)
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
                    message = "Ürün silerken hata oluştu.",
                    status = 500,
                    data = "Ürün silerken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string saveUrun(URUN data)
        {
            try
            {
                new RURUN().SaveOrUpdate(data);

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
                    message = "Ürün eklerken hata oluştu.",
                    status = 500,
                    data = "Ürün eklerken hata oluştu."
                });
            }
        }

    }
}