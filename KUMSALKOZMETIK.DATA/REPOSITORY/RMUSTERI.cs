using KUMSALKOZMETIK.DATA.BASE.Functions;
using KUMSALKOZMETIK.DATA.ENTITY;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.REPOSITORY
{
    public class RMUSTERI : Repository<MUSTERI>
    {
        public Int32 CreateUser(MUSTERI m)
        {
            Int32 val = 0;
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var obj = sess.CreateSQLQuery("exec dbo.KullaniciKayit :prmt1,:prmt2,:prmt3,:prmt4,:prmt5,:prmt6,:prmt7");
                     
                    obj.SetParameter("prmt1", m.MU_AD_SOYAD);
                    obj.SetParameter("prmt2", m.MU_SIRKET);
                    obj.SetParameter("prmt3", m.MU_KULLANICI_ADI);
                    obj.SetParameter("prmt4", m.MU_TELEFON);
                    obj.SetParameter("prmt5", m.MU_ADRES);
                    obj.SetParameter("prmt6", m.MU_EMAIL);
                    obj.SetParameter("prmt7", m.MU_SIFRE);
                     
                    val = obj.UniqueResult<int>(); 
                }
            }
            catch (Exception exception)
            {
                throw new Exception("RepositoryKategori>GetData", exception);
            }

            return val;
        }
        public bool CheckUser(string kullaniciadi, string sifre)
        {
            Int32 val = 0;
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var obj = sess.CreateSQLQuery("exec dbo.tr_kullanici_sorgulama :kln,:sfr ");

                    obj.SetParameter("kln", kullaniciadi);
                    obj.SetParameter("sfr", sifre);

                    val = obj.UniqueResult<int>();

                }
            }
            catch (Exception exception)
            {
                throw new Exception("RepositoryKategori>GetData", exception);
            }

            return val > 0 ? true : false;
        }

    }
}
