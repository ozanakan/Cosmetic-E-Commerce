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
    public partial class detay : System.Web.UI.Page
    {
        [WebMethod]
        public static string UrunGetir(int? id)
        {
            try
            {
                VIEW_URUN urun = new RVIEW_URUN().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("UR_ID",id)
                    });

                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = urun
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
                    message = "Kategoriler yüklenirken hata oluştu.",
                    status = 500,
                    data = "Categoriler yüklenirken hata oluştu."
                });
            }
        }


    }
}