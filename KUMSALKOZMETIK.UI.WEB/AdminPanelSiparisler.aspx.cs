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
    public partial class AdminPanelSiparisler : System.Web.UI.Page
    {

        [WebMethod]
        public static string getSiparis()
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RVIEW_SIPARIS().GetAll().OrderByDescending(x => x.SP_CREATED)
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Sipariş yüklenirken hata oluştu.",
                    status = 500,
                    data = "Sipariş yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string getSiparisDetay(int? id)
        {
            try
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = new RVIEW_SIPARIS_DETAY().GetAll(new List<ICriterion>()
                    {
                        Restrictions.Eq("SPD_SP_ID",id)
                    }).OrderByDescending(x => x.SPD_ID)
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Sipariş detayı yüklenirken hata oluştu.",
                    status = 500,
                    data = "Sipariş detayı yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string deleteSiparis(int? id)
        {
            try
            {
                var data = new RSIPARIS().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("SP_ID",id)
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
                    message = "Sipariş silerken hata oluştu.",
                    status = 500,
                    data = "Sipariş silerken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string changestatus(int id, string durum)
        {
            try
            {
                var data = new RSIPARIS().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("SP_ID",id)
                    });

                if (data != null)
                {
                    data.SP_DURUM = durum;
                    new RSIPARIS().SaveOrUpdate(data);
                }

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
                    message = "Durum güncellenirken hata oluştu.",
                    status = 500,
                    data = "Durum güncellenirken hata oluştu."
                });
            }
        }
    }
}