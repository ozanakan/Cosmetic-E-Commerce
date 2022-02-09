using System;
using NHibernate;
using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using KUMSALKOZMETIK.DATA.ENTITY;
using KUMSALKOZMETIK.DATA.BASE.Objects;

namespace KUMSALKOZMETIK.DATA.BASE.Functions
{
    public class SessionFactory
    {
        public static ISessionFactory _sessionFactory; 

        private static readonly object PadlockINFOR = new object();
         
        private SessionFactory()
        {

        }
        public static ISessionFactory GetFactory()
        {
            lock (PadlockINFOR)
            {
                if (_sessionFactory == null)
                {
                    try
                    {
                        _sessionFactory = Fluently.Configure().Database(MsSqlConfiguration.MsSql2008.ConnectionString(DbSettings.ConnectionString))
                                .Mappings(m => m.FluentMappings.AddFromAssemblyOf<KATEGORI>())
                                .ExposeConfiguration(x => x.SetProperty("connection.release_mode", "on_close"))
                                .BuildSessionFactory();
                         
                    }
                    catch (Exception exc)
                    {
                        throw new Exception("Connection can not be established.", exc);
                    }
                }
            }

            return _sessionFactory;
        }
         
    } 
}
