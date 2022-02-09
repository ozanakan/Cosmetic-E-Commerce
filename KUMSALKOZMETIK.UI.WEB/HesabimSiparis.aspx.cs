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
    public partial class HesabimSiparis : System.Web.UI.Page
    {

        [WebMethod]
        public static string getSiparis()
        {
            try
            {
                SESSIONENTITY session = new RSESSION().GetSession();

                List<VIEW_SIPARIS> tmprdata = null;

                if (session.Musteri != null)
                {
                    tmprdata = new RVIEW_SIPARIS().GetAll(new List<ICriterion>()
                    {
                        Restrictions.Eq("MU_ID",session.Musteri.MU_ID)
                    }).OrderByDescending(x => x.SP_CREATED).ToList<VIEW_SIPARIS>();
                }

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = tmprdata
                });
            }
            catch (Exception e)
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
            catch (Exception e)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Sipariş detayı yüklenirken hata oluştu.",
                    status = 500,
                    data = "Sipariş detayı yüklenirken hata oluştu."
                });
            }
        }
    }
}