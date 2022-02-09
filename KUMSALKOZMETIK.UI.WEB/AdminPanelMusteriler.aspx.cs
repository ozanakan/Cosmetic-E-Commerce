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
    public partial class AdminPanelMusteriler : System.Web.UI.Page
    {

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
                    message = "Kategori yüklenirken hata oluştu.",
                    status = 500,
                    data = "Kategori yüklenirken hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string deleteMusteri(int? id)
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
        public static string saveMusteri(MUSTERI data)
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
                    message = "Müşteriyi eklerken hata oluştu.",
                    status = 500,
                    data = "Müşteriyi eklerken hata oluştu."
                });
            }
        }
    }
}