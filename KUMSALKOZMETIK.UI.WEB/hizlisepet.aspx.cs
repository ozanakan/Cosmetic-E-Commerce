using KUMSALKOZMETIK.DATA.ENTITY;
using KUMSALKOZMETIK.DATA.REPOSITORY;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KUMSALKOZMETIK.UI.WEB
{
    public partial class hizlisepet : System.Web.UI.Page
    {
        [WebMethod]
        public static string FastCartAdd(string Siparis)
        {
            try
            {
                SESSIONENTITY session = new RSESSION().GetSession();
                if (session.Musteri == null)
                {
                    return JsonConvert.SerializeObject(new
                    {
                        message = "Completed",
                        status = 300
                    });
                }

                //SIPARIS data = new SIPARIS
                //{
                //    SP_MUSTERI = session.Musteri.MU_KULLANICI_ADI, 
                //    SP_DURUM = "SİPARİŞ OLUŞTURULDU",
                //    SP_TOPLAM_URUN = 
                //};

                //new RSIPARIS().Save(data);

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
                    message = "Hızlı sipariş eklenirken sırasında hata oluştu.",
                    status = 500,
                    data = "Hızlı sipariş eklenirken sırasında hata oluştu."
                });
            }
        }
    }
}
