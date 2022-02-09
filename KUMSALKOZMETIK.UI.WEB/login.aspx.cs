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
    public partial class login : System.Web.UI.Page
    {
        [WebMethod]
        public static string CheckUser(string user, string pass)
        {
            try
            {
                var kln = new RMUSTERI().CheckUser(user, pass);

                if (kln)
                {
                    MUSTERI musteri = new RMUSTERI().Get(new List<ICriterion>()
                    {
                        Restrictions.Eq("MU_KULLANICI_ADI",user),
                        Restrictions.Eq("MU_SIFRE",pass)
                    });

                    new RSESSION().AddUser(musteri);

                    return JsonConvert.SerializeObject(new
                    {
                        message = "Completed",
                        status = 200,
                        data = new RSESSION().AddUser(musteri)
                    });
                } 

                return JsonConvert.SerializeObject(new
                {
                    message = "Giriş işlemi başarısız oldu. Kullanıcı adınızı ve şifrenizi kontrol ediniz",
                    status = 500,
                    data = "Giriş işlemi başarısız oldu. Kullanıcı adınızı ve şifrenizi kontrol ediniz"
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
        public static string CreateMusteri(MUSTERI mst)
        {
            try
            {
                var stt = new RMUSTERI().CreateUser(mst);
                var msg = "";

                if (stt == 0)
                    msg = "Kullanıcı oluşturulamadı.";
                if (stt == 1)
                    msg = "Kullanıcı başarıyla oluşturuldu";
                if (stt == 2)
                    msg = "Bu kullanıcı adı kullanılmakta. Lüften başka bir kullanıcı adı deneyiniz."; 
                  
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
                    message = "Yeni kullanıcı oluşturulurken",
                    status = 500,
                    data = "Yeni kullanıcı oluşturulurken"
                });
            }
        }

        [WebMethod]
        public static string kontrol()
        {
            try
            {
                SESSIONENTITY session = new RSESSION().GetSession();
                return JsonConvert.SerializeObject(new
                {
                    message = "Completed",
                    status = 200,
                    data = session
                });
            }
            catch (Exception)
            {
                return JsonConvert.SerializeObject(new
                {
                    message = "Session kontrolü sırasında hata oluştu.",
                    status = 500,
                    data = "Session kontrolü sırasında hata oluştu."
                });
            }
        }

        [WebMethod]
        public static string sessionkill()
        {
            try
            {
                new RSESSION().SessionKill();
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
                    message = "Oturum sonlandırılırken hata oluştu.",
                    status = 500,
                    data = "Oturum sonlandırılırken hata oluştu."
                });
            }
        }
    }
}