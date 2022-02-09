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
    public class RVIEW_URUN : Repository<VIEW_URUN>
    {
        public IList<VIEW_URUN> GetData(string shortcolon, string shorttype, int[] filterMarka, int[] filterustkategori, int[] filterkategori, int[] filteraltkategori, string filterall, bool firsatmi, decimal? maxfiyat, decimal? minfiyat)
        {
            IList<VIEW_URUN> list2;
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    ICriteria criteria = sess.CreateCriteria<VIEW_URUN>();
                    if (filterMarka.Length > 0)
                    {
                        criteria = criteria.Add(Restrictions.In("UR_MARKA", filterMarka));
                    }
                    if (filterustkategori.Length > 0)
                    {
                        criteria = criteria.Add(Restrictions.In("UK_ID", filterustkategori));
                    }
                    if (filterkategori.Length > 0)
                    {
                        criteria = criteria.Add(Restrictions.In("KA_ID", filterkategori));
                    }
                    if (filteraltkategori.Length > 0)
                    {
                        criteria = criteria.Add(Restrictions.In("UR_KATEGORI", filteraltkategori));
                    }

                    if (maxfiyat != null)
                    {
                        criteria = criteria.Add(Restrictions.Or(
                            Restrictions.Le("UR_FIYAT", Convert.ToDecimal(maxfiyat)),
                             Restrictions.Le("UR_FIYAT_INDIRIMLI", Convert.ToDecimal(maxfiyat))));
                    }

                    if (minfiyat != null)
                    {
                        criteria = criteria.Add(Restrictions.Or(
                               Restrictions.Ge("UR_FIYAT", Convert.ToDecimal(minfiyat)),
                               Restrictions.Ge("UR_FIYAT_INDIRIMLI", Convert.ToDecimal(minfiyat))));
                    }

                    if (!string.IsNullOrWhiteSpace(filterall) && filterall != "null")
                    {
                        criteria = criteria.Add(Restrictions.InsensitiveLike("UR_AD", filterall, MatchMode.Anywhere));
                    }
                    if (firsatmi)
                    {
                        criteria = criteria.Add(Restrictions.IsNotNull("UR_INDIRIM"));
                    }

                    if (!string.IsNullOrWhiteSpace(shorttype) && !string.IsNullOrWhiteSpace(shortcolon))
                    {
                        criteria = criteria.AddOrder(shorttype == "asc" ? Order.Asc(shortcolon) : Order.Desc(shortcolon));
                    }

                    list2 = criteria.List<VIEW_URUN>().ToList<VIEW_URUN>();
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
