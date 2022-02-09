using KUMSALKOZMETIK.DATA.BASE.Objects;
using KUMSALKOZMETIK.DATA.BASE.Objects.Interface;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;

namespace KUMSALKOZMETIK.DATA.BASE.Functions
{
    public abstract class Repository<T> : IRepository<T>, IDisposable
    {
        public object Query(string s)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var tmpr = sess.CreateSQLQuery(s).UniqueResult();
                    sess.Flush();
                    return tmpr == null ? "" : tmpr;
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.Query.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public virtual T Save(T obj)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    sess.Save(obj);
                    sess.Flush();
                    return obj;
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{2}.Save.Err : {0} Data : {1}", e.Message, ExeptionDataBuilder<T>.DataBuilder(obj), typeof(T).FullName), e);
            }
        }

        public T Update(T obj)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    sess.Update(obj);
                    sess.Flush();
                    return obj;
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{2}.Update.Err : {0} Data : {1}", e.Message, ExeptionDataBuilder<T>.DataBuilder(obj), typeof(T).FullName), e);
            }
        }

        public T SaveOrUpdate(T obj)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    sess.SaveOrUpdate(obj);
                    sess.Flush();
                    return obj;
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{2}.SaveOrUpdate.Err : {0} Data : {1}", e.Message, ExeptionDataBuilder<T>.DataBuilder(obj), typeof(T).FullName), e);
            }
        }

        public void Delete(T obj)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    sess.Delete(obj);
                    sess.Flush();
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{2}.Delete.Err : {0} Data : {1}", e.Message, ExeptionDataBuilder<T>.DataBuilder(obj), typeof(T).FullName), e);
            }
        }

        public T Get(object id)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    return sess.Get<T>(id);
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.Get.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public T Get(IList<ICriterion> criteriaList)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var cr = sess.CreateCriteria(typeof(T));
                    foreach (var sExp in criteriaList)
                    {
                        cr = cr.Add(sExp);
                    }
                    return cr.List<T>().FirstOrDefault();
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.Get.Err : {0}", e.Message, typeof(T).FullName), e);
            }

        }

        public IList<T> GetCustomQuery(string hql)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var obj = sess.CreateSQLQuery(hql);
                    obj.AddEntity(typeof(T).Name, typeof(T));
                    return obj.List<T>();
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.GetCustomQuery.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public IList<object> GetCustomQuery2(string hql)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var obj = sess.CreateSQLQuery(hql).List<object>();
                    return obj;
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("Repository.GetCustomQuery2.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public object GetCustomQuery3(string hql)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var query = string.Format(hql);

                    var queryResult = sess.CreateSQLQuery(query).UniqueResult();
                    return queryResult;
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.Repository.GetCustomQuery3", e.Message, typeof(T).FullName), e);
            }
        }

        public IList<T> GetAll()
        {
            try
            {
                using (var session = SessionFactory.GetFactory().OpenSession())
                {
                    var cr = session.CreateCriteria(typeof(T));
                    return cr.List<T>();
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.GetAll.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public IList<T> GetAll(IList<ICriterion> criteriaList)
        {
            try
            {
                using (var session = SessionFactory.GetFactory().OpenSession())
                {
                    var cr = session.CreateCriteria(typeof(T));
                    foreach (var sExp in criteriaList)
                    {
                        cr = cr.Add(sExp);
                    }
                    return cr.List<T>();
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.GetAll.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public IList<T> GetAll(IList<ICriterion> criteriaList, Filter[] filters)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var cr = sess.CreateCriteria(typeof(T));

                    foreach (var sExp in criteriaList)
                    {
                        cr = cr.Add(sExp);
                    }

                    cr = new CustomFilter().AddFilters(filters, cr, "", "");

                    return cr.List<T>();
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.GetAll.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public IList<T> GetAll(IList<ICriterion> criteriaList, Filter[] filters, string shorttype, string shortcolon)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var cr = sess.CreateCriteria(typeof(T));

                    if (criteriaList != null)
                        foreach (var sExp in criteriaList)
                        {
                            cr = cr.Add(sExp);
                        }

                    cr = new CustomFilter().AddFilters(filters, cr, shorttype, shortcolon);

                    return cr.List<T>();
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.GetAll.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public IList<T> GetAll(IList<ICriterion> criteriaList, Filter[] filters, string shorttype, string shortcolon, int pageIndex, int pageSize)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var criteria = sess.CreateCriteria(typeof(T));


                    if (criteriaList != null)
                        foreach (var sExp in criteriaList)
                        {
                            criteria = criteria.Add(sExp);
                        }

                    if (pageSize > 0)
                    {
                        criteria.SetMaxResults(pageSize);
                    }
                    criteria.SetFirstResult((pageIndex - 1) * pageSize);
                    criteria = new CustomFilter().AddFilters(filters, criteria, shorttype, shortcolon);
                    return criteria.List<T>();
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.GetAll.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public long GetAllCount(IList<ICriterion> criteriaList, Filter[] filters)
        {
            try
            {
                using (var sess = SessionFactory.GetFactory().OpenSession())
                {
                    var cr = sess.CreateCriteria(typeof(T));

                    foreach (var sExp in criteriaList)
                    {
                        cr = cr.Add(sExp);
                    }

                    cr = new CustomFilter().AddFilters(filters, cr, "", "");

                    cr.SetProjection(Projections.RowCountInt64());

                    return cr.UniqueResult<long>();
                }
            }
            catch (Exception e)
            {
                throw new Exception(string.Format("{1}.GetAll.Err : {0}", e.Message, typeof(T).FullName), e);
            }
        }

        public void Dispose()
        {
            using (var sess = SessionFactory.GetFactory().OpenSession())
            {
                if (sess.IsOpen)
                    sess.Close();
            }
        }

    }
}
