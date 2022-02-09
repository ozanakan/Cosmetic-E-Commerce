using KUMSALKOZMETIK.DATA.ENTITY;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace KUMSALKOZMETIK.DATA.REPOSITORY
{  
    public class RSESSION
    {
        public SESSIONENTITY userdata = null;

        public RSESSION()
        {
            this.userdata = (SESSIONENTITY)HttpContext.Current.Session["UserSession"];
            if (this.userdata == null)
            {
                this.userdata = new SESSIONENTITY();
                this.userdata.Sepet = new List<SEPETENTITY>();
                HttpContext.Current.Session["UserSession"] = this.userdata;
            }
        }

        public void AddCost(SEPETENTITY sepet)
        {
            try
            { 
                SEPETENTITY item = userdata.Sepet.FirstOrDefault<SEPETENTITY>(x => x.UrunId == sepet.UrunId);
                if (item == null)
                {
                    this.userdata.Sepet.Add(sepet);
                }
                else
                {
                    this.userdata.Sepet.Remove(item);
                    if (sepet.UrunAdet == 1)
                    {
                        item.UrunAdet += sepet.UrunAdet;
                    }
                    else
                    {
                        item.UrunAdet = sepet.UrunAdet;
                    }
                    this.userdata.Sepet.Add(item);
                }
                HttpContext.Current.Session["UserSession"] = this.userdata;
            }
            catch (Exception e)
            { 
                throw;
            }
        }

        public SESSIONENTITY AddUser(MUSTERI musteri)
        {
            this.userdata.Musteri = musteri;
            HttpContext.Current.Session["UserSession"] = this.userdata;
            return this.userdata;
        }

        public void DeleteItemFromCost(SEPETENTITY sepet)
        {
            SEPETENTITY item = this.userdata.Sepet.FirstOrDefault<SEPETENTITY>(x => x.UrunId == sepet.UrunId);
            if (item != null)
            {
                this.userdata.Sepet.Remove(item);
            }
            HttpContext.Current.Session["UserSession"] = this.userdata;
        }

        public void EmptCast()
        {
            this.userdata.Sepet = new List<SEPETENTITY>();
            HttpContext.Current.Session["UserSession"] = this.userdata;
        }

        public SESSIONENTITY GetSession()
        {
            this.userdata = (SESSIONENTITY)HttpContext.Current.Session["UserSession"];
            return this.userdata;
        }

        public void SessionKill()
        {
            this.userdata.Sepet = null;
            this.userdata.Musteri = null;
            HttpContext.Current.Session["UserSession"] = this.userdata;
        }
    }
}

