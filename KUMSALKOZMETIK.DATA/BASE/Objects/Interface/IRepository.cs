using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.BASE.Objects.Interface
{
    public interface IRepository<T>
    {
        object Query(string s);
        T Save(T obj);
        T Update(T obj);
        T SaveOrUpdate(T obj);
        void Delete(T obj);
        T Get(object id);
        T Get(IList<ICriterion> criteriaList);
        IList<T> GetCustomQuery(string hql);
        IList<object> GetCustomQuery2(string hql);
        object GetCustomQuery3(string hql);
        IList<T> GetAll();
        IList<T> GetAll(IList<ICriterion> criteriaList);
        IList<T> GetAll(IList<ICriterion> criteriaList, Filter[] filters);
        IList<T> GetAll(IList<ICriterion> criteriaList, Filter[] filters, string shorttype, string shortcolon);
        IList<T> GetAll(IList<ICriterion> criteriaList, Filter[] filters, string shorttype, string shortcolon, int pageIndex, int pageSize);
    }
}
