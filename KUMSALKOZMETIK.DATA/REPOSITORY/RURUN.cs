using KUMSALKOZMETIK.DATA.BASE.Functions;
using KUMSALKOZMETIK.DATA.ENTITY;
using NHibernate;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.REPOSITORY
{
    public class RURUN : Repository<URUN>
    {  
        public IList<URUN> GetData(int[] filterMarka, int[] filterkategori, string filterall, bool firsatmi)
        {
            IList<URUN> list2;
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    ICriteria criteria = sess.CreateCriteria<URUN>();
                    if (filterMarka.Length > 0)
                    {
                        criteria = criteria.Add(Restrictions.In("UR_MARKA", filterMarka));
                    }
                    if (filterkategori.Length > 0)
                    {
                        criteria = criteria.Add(Restrictions.In("UR_KATEGORI", filterkategori));
                    }
                    if (!string.IsNullOrWhiteSpace(filterall))
                    {
                        criteria = criteria.Add(Restrictions.InsensitiveLike("UR_AD", filterall, MatchMode.Anywhere));
                    }
                    if (firsatmi)
                    {
                        criteria = criteria.Add(Restrictions.IsNotNull("UR_INDIRIM"));
                    }
                    list2 = criteria.List<URUN>().ToList<URUN>();
                }
            }
            catch (Exception exception)
            {
                throw new Exception("RepositoryKategori>GetData", exception);
            }
            return list2;
        }
    }
}
