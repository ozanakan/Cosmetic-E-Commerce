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
    public partial class HesabimAdres : System.Web.UI.Page
    {

        [WebMethod]
        public static string GetAdres()
        {
            try
            {
                var user = new RSESSION().GetSession();

                MUSTERI musteri = new RMUSTERI().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("MU_ID",user.Musteri.MU_ID),

                    });

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = musteri
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Giriş işleminde hata oluştu.",
                    status = 500,
                    data = "Giriş işleminde hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string saveAdres(MUSTERI data)
        {
            try
            {
                new RMUSTERI().SaveOrUpdate(data);

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
                    message = "Adres eklerken hata oluştu.",
                    status = 500,
                    data = "Adres eklerken hata oluştu."
                });
            }
        }






    }
}