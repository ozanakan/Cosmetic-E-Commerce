using KUMSALKOZMETIK.DATA.BASE.Objects;
using NHibernate;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.BASE.Functions
{
    public class CustomFilter
    {
        public ICriteria AddFilters(Filter[] filter, ICriteria cr, string shorttype, string shortcolon)
        {
            try
            {
                if (filter != null)
                {
                    foreach (Filter flt in filter)
                    {
                        if (flt.filtervartype == "date")
                        {
                            switch (flt.FilterTypes)
                            {


                                case "":
                                    var tmpr1 = DateTime.ParseExact(flt.val, "dd.MM.yyyy",
                                      System.Globalization.CultureInfo.InvariantCulture);

                                    cr = cr.Add(Restrictions.Le(flt.key, tmpr1.AddDays(1)));
                                    cr = cr.Add(Restrictions.Gt(flt.key, tmpr1.AddDays(-1)));

                                    break;
                                case "Eşit":
                                    var tmpr2 = DateTime.ParseExact(flt.val, "dd.MM.yyyy",
                                   System.Globalization.CultureInfo.InvariantCulture);

                                    cr = cr.Add(Restrictions.Le(flt.key, tmpr2.AddDays(1)));
                                    cr = cr.Add(Restrictions.Gt(flt.key, tmpr2.AddDays(-1)));
                                    break;
                                case "Eşit Değil":
                                    cr = cr.Add(Restrictions.Not(Restrictions.Eq(flt.key, DateTime.ParseExact(flt.val, "dd.MM.yyyy",
                                      System.Globalization.CultureInfo.InvariantCulture))));
                                    break;
                                case "Küçük":
                                    cr = cr.Add(Restrictions.Le(flt.key, DateTime.ParseExact(flt.val, "dd.MM.yyyy",
                                      System.Globalization.CultureInfo.InvariantCulture)));
                                    break;
                                case "Büyük":
                                    cr = cr.Add(Restrictions.Gt(flt.key, DateTime.ParseExact(flt.val, "dd.MM.yyyy",
                                      System.Globalization.CultureInfo.InvariantCulture)));
                                    break;
                                case "Küçük Eşit":
                                    cr = cr.Add(Restrictions.Le(flt.key, DateTime.ParseExact(flt.val, "dd.MM.yyyy",
                                      System.Globalization.CultureInfo.InvariantCulture)));
                                    break;
                                case "Büyük Eşit":
                                    cr = cr.Add(Restrictions.Ge(flt.key, DateTime.ParseExact(flt.val, "dd.MM.yyyy",
                                      System.Globalization.CultureInfo.InvariantCulture)));
                                    break;
                                case "Boş":
                                    cr = cr.Add(Restrictions.IsNull(flt.key));
                                    break;
                                case "Boş Değil":
                                    cr = cr.Add(Restrictions.IsNotNull(flt.key));
                                    break;

                            }
                        }
                        else if (flt.filtervartype == "decimal")
                        {
                            switch (flt.FilterTypes)
                            {
                                case "":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Eq(flt.key, Convert.ToDecimal(flt.val)));
                                    break;
                                case "Eşit":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Eq(flt.key, Convert.ToDecimal(flt.val)));
                                    break;
                                case "Eşit Değil":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Not(Restrictions.Eq(flt.key, Convert.ToDecimal(flt.val))));
                                    break;
                                case "Büyük":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Gt(flt.key, Convert.ToDecimal(flt.val)));
                                    break;
                                case "Küçük":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Le(flt.key, Convert.ToDecimal(flt.val)));
                                    break;
                                case "Büyük Eşit":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Ge(flt.key, Convert.ToDecimal(flt.val)));
                                    break;
                                case "Küçük Eşit":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Le(flt.key, Convert.ToDecimal(flt.val)));
                                    break;

                                case "Boş":
                                    cr = cr.Add(Restrictions.IsNull(flt.key));
                                    break;
                                case "Boş Değil":
                                    cr = cr.Add(Restrictions.IsNotNull(flt.key));
                                    break;
                            }
                        }
                        else if (flt.filtervartype == "number" || flt.filtervartype == "int")
                        {
                            switch (flt.FilterTypes)
                            {
                                case "":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Eq(flt.key, Convert.ToInt32(flt.val)));
                                    break;
                                case "Eşit":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Eq(flt.key, Convert.ToInt32(flt.val)));
                                    break;
                                case "Eşit Değil":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Not(Restrictions.Eq(flt.key, Convert.ToInt32(flt.val))));
                                    break;
                                case "Büyük":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Gt(flt.key, Convert.ToInt32(flt.val)));
                                    break;
                                case "Küçük":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Le(flt.key, Convert.ToInt32(flt.val)));
                                    break;
                                case "Büyük Eşit":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Ge(flt.key, Convert.ToInt32(flt.val)));
                                    break;
                                case "Küçük Eşit":
                                    if (!string.IsNullOrWhiteSpace(flt.val))
                                        cr = cr.Add(Restrictions.Le(flt.key, Convert.ToInt32(flt.val)));
                                    break;

                                case "Boş":
                                    cr = cr.Add(Restrictions.IsNull(flt.key));
                                    break;
                                case "Boş Değil":
                                    cr = cr.Add(Restrictions.IsNotNull(flt.key));
                                    break;
                            }
                        }
                        else if (flt.filtervartype == "nvarchar" || flt.filtervartype == "string")
                        {
                            switch (flt.FilterTypes)
                            {
                                case "":
                                    cr = cr.Add(Restrictions.InsensitiveLike(flt.key, flt.val, MatchMode.Anywhere));
                                    break;
                                case "Eşit":
                                    cr = cr.Add(Restrictions.Eq(flt.key, flt.val));
                                    break;
                                case "Eşit Değil":
                                    cr = cr.Add(Restrictions.Not(Restrictions.Eq(flt.key, flt.val)));
                                    break;
                                case "İçerir":
                                    cr = cr.Add(Restrictions.InsensitiveLike(flt.key, flt.val, MatchMode.Anywhere));
                                    break;
                                case "İçermez":
                                    cr = cr.Add(Restrictions.Not(Restrictions.InsensitiveLike(flt.key, flt.val, MatchMode.Anywhere)));
                                    break;
                                case "Boş":
                                    cr = cr.Add(Restrictions.IsNull(flt.key));
                                    break;
                                case "Boş Değil":
                                    cr = cr.Add(Restrictions.IsNotNull(flt.key));
                                    break;
                                case "Ile Başlayan":
                                    cr = cr.Add(Restrictions.InsensitiveLike(flt.key, flt.val, MatchMode.Start));
                                    break;
                                case "Ile Biten":
                                    cr = cr.Add(Restrictions.InsensitiveLike(flt.key, flt.val, MatchMode.End));
                                    break;
                            }
                        }
                        else if (flt.filtervartype == "bool")
                        {
                            switch (flt.FilterTypes)
                            {
                                case "True":
                                    cr = cr.Add(Restrictions.Eq(flt.key, "+"));
                                    break;
                                case "False":
                                    cr = cr.Add(Restrictions.Eq(flt.key, "-"));
                                    break;
                                case "Boş":
                                    cr = cr.Add(Restrictions.IsNull(flt.key));
                                    break;
                                case "Boş Değil":
                                    cr = cr.Add(Restrictions.IsNotNull(flt.key));
                                    break;
                            }
                        }
                        else
                        {
                            if (!string.IsNullOrWhiteSpace(flt.key) && !string.IsNullOrWhiteSpace(flt.val))
                                cr = cr.Add(Restrictions.Eq(flt.key, flt.val));
                        }
                    }
                }

                //listeme işlemi burada yapılıyor

                if (!string.IsNullOrWhiteSpace(shorttype) && !string.IsNullOrWhiteSpace(shortcolon))
                {
                    cr = cr.AddOrder(shorttype == "asc" ? Order.Asc(shortcolon) : Order.Desc(shortcolon));
                }

                return cr;
            }
            catch (Exception)
            {

                return cr;
            }
        }

        public string AddFilters(Filter[] filterlst, string whereQuery)
        {
            if (filterlst != null)
            {
                foreach (var flt in filterlst)
                {
                    if (flt.filtervartype == "date")
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                whereQuery = whereQuery + string.Format("AND {0}>= TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Eşit":
                                whereQuery = whereQuery + string.Format("AND {0}= TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Eşit Değil":
                                whereQuery = whereQuery + string.Format("AND {0}<> TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Küçük":
                                whereQuery = whereQuery + string.Format("AND {0}< TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Büyük":
                                whereQuery = whereQuery + string.Format("AND {0}> TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Küçük Eşit":
                                whereQuery = whereQuery + string.Format("AND {0}<= TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Büyük Eşit":
                                whereQuery = whereQuery + string.Format("AND {0}>= TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Boş":
                                whereQuery = whereQuery + string.Format("AND {0} IS NULL') ", flt.key);
                                break;
                            case "Boş Değil":
                                whereQuery = whereQuery + string.Format("AND {0} IS NOT NULL') ", flt.key);
                                break;
                        }
                    }
                    else if (flt.filtervartype == "number" || flt.filtervartype == "int" || flt.filtervartype == "decimal")
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                whereQuery = whereQuery + string.Format("AND {0} = {1} ", flt.key, flt.val);
                                break;
                            case "Eşit":
                                whereQuery = whereQuery + string.Format("AND {0} = {1} ", flt.key, flt.val);
                                break;
                            case "Eşit Değil":
                                whereQuery = whereQuery + string.Format("AND {0} <> {1} ", flt.key, flt.val);
                                break;
                            case "Küçük":
                                whereQuery = whereQuery + string.Format("AND {0} < {1} ", flt.key, flt.val);
                                break;
                            case "Büyük":
                                whereQuery = whereQuery + string.Format("AND {0} > {1} ", flt.key, flt.val);
                                break;
                            case "Küçük Eşit":
                                whereQuery = whereQuery + string.Format("AND {0} <= {1} ", flt.key, flt.val);
                                break;
                            case "Büyük Eşit":
                                whereQuery = whereQuery + string.Format("AND {0} >= {1} ", flt.key, flt.val);
                                break;
                            case "Boş":
                                whereQuery = whereQuery + string.Format("AND {0} IS NULL') ", flt.key);
                                break;
                            case "Boş Değil":
                                whereQuery = whereQuery + string.Format("AND {0} IS NOT NULL') ", flt.key);
                                break;
                        }
                    }
                    else if (flt.filtervartype == "nvarchar" || flt.filtervartype == "string")
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) LIKE UPPER('%{1}%') ", flt.key, flt.val);
                                break;
                            case "Eşit":
                                whereQuery = whereQuery + string.Format("AND {0} = '{1}' ", flt.key, flt.val);
                                break;
                            case "Eşit Değil":
                                whereQuery = whereQuery + string.Format("AND {0} <> '{1}' ", flt.key, flt.val);
                                break;
                            case "İçerir":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) LIKE UPPER('%{1}%') ", flt.key, flt.val);
                                break;
                            case "İçermez":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) NOT LIKE UPPER('%{1}%') ", flt.key, flt.val);
                                break;
                            case "Boş":
                                whereQuery = whereQuery + string.Format("AND {0} IS NULL') ", flt.key);
                                break;
                            case "Boş Değil":
                                whereQuery = whereQuery + string.Format("AND {0} IS NOT NULL') ", flt.key);
                                break;
                            case "Ile Başlayan":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) LIKE UPPER('{1}%') ", flt.key, flt.val);
                                break;
                            case "Ile Biten":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) LIKE UPPER('%{1}') ", flt.key, flt.val);
                                break;
                        }
                    }
                    else if (flt.filtervartype == "bool")
                    {
                        switch (flt.FilterTypes)
                        {
                            case "True":
                                whereQuery = whereQuery + string.Format("AND ({0} = True OR  '{0}' = '+')", flt.key);
                                break;
                            case "False":
                                whereQuery = whereQuery + string.Format("AND ({0} = False OR  '{0}' = '-')", flt.key);
                                break;
                            case "Boş":
                                whereQuery = whereQuery + string.Format("AND {0} IS NULL') ", flt.key);
                                break;
                            case "Boş Değil":
                                whereQuery = whereQuery + string.Format("AND {0} IS NOT NULL') ", flt.key);
                                break;
                        }
                    }
                }
            }
            return whereQuery;
        }

        public string MaintenancePlanningAddFilters(Filter[] filterlst, string whereQuery)
        {
            if (filterlst != null)
            {
                foreach (var flt in filterlst
                    .Where(x =>
                        x.key != "TMP_REMAINING_CD_TODAY"
                        && x.key != "TMP_REMAINING_HRS_TODAY"
                        && x.key != "TMP_REMAINING_CYC_TODAY"
                        && x.key != "TMP_REMAINING_CD_LAST_MV"
                        && x.key != "TMP_REMAINING_HRS_LAST_MV"
                        && x.key != "TMP_REMAINING_CYC_LAST_MV"))
                {
                    if (flt.filtervartype == "date")
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                whereQuery = whereQuery + string.Format("AND {0}>= TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Eşit":
                                whereQuery = whereQuery + string.Format("AND {0}= TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Eşit Değil":
                                whereQuery = whereQuery + string.Format("AND {0}<> TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Küçük":
                                whereQuery = whereQuery + string.Format("AND {0}< TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Büyük":
                                whereQuery = whereQuery + string.Format("AND {0}> TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Küçük Eşit":
                                whereQuery = whereQuery + string.Format("AND {0}<= TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Büyük Eşit":
                                whereQuery = whereQuery + string.Format("AND {0}>= TO_DATE('{1}','dd-mm-yyyy hh24:mi') ", flt.key, flt.val);
                                break;
                            case "Boş":
                                whereQuery = whereQuery + string.Format("AND {0} IS NULL') ", flt.key);
                                break;
                            case "Boş Değil":
                                whereQuery = whereQuery + string.Format("AND {0} IS NOT NULL') ", flt.key);
                                break;
                        }
                    }
                    else if (flt.filtervartype == "number" || flt.filtervartype == "int" || flt.filtervartype == "decimal")
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                whereQuery = whereQuery + string.Format("AND {0} = {1} ", flt.key, flt.val);
                                break;
                            case "Eşit":
                                whereQuery = whereQuery + string.Format("AND {0} = {1} ", flt.key, flt.val);
                                break;
                            case "Eşit Değil":
                                whereQuery = whereQuery + string.Format("AND {0} <> {1} ", flt.key, flt.val);
                                break;
                            case "Küçük":
                                whereQuery = whereQuery + string.Format("AND {0} < {1} ", flt.key, flt.val);
                                break;
                            case "Büyük":
                                whereQuery = whereQuery + string.Format("AND {0} > {1} ", flt.key, flt.val);
                                break;
                            case "Küçük Eşit":
                                whereQuery = whereQuery + string.Format("AND {0} <= {1} ", flt.key, flt.val);
                                break;
                            case "Büyük Eşit":
                                whereQuery = whereQuery + string.Format("AND {0} >= {1} ", flt.key, flt.val);
                                break;
                            case "Boş":
                                whereQuery = whereQuery + string.Format("AND {0} IS NULL') ", flt.key);
                                break;
                            case "Boş Değil":
                                whereQuery = whereQuery + string.Format("AND {0} IS NOT NULL') ", flt.key);
                                break;
                        }
                    }
                    else if (flt.filtervartype == "nvarchar" || flt.filtervartype == "string")
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) LIKE UPPER('%{1}%') ", flt.key, flt.val);
                                break;
                            case "Eşit":
                                whereQuery = whereQuery + string.Format("AND {0} = '{1}' ", flt.key, flt.val);
                                break;
                            case "Eşit Değil":
                                whereQuery = whereQuery + string.Format("AND {0} <> '{1}' ", flt.key, flt.val);
                                break;
                            case "İçerir":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) LIKE UPPER('%{1}%') ", flt.key, flt.val);
                                break;
                            case "İçermez":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) NOT LIKE UPPER('%{1}%') ", flt.key, flt.val);
                                break;
                            case "Boş":
                                whereQuery = whereQuery + string.Format("AND {0} IS NULL') ", flt.key);
                                break;
                            case "Boş Değil":
                                whereQuery = whereQuery + string.Format("AND {0} IS NOT NULL') ", flt.key);
                                break;
                            case "Ile Başlayan":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) LIKE UPPER('{1}%') ", flt.key, flt.val);
                                break;
                            case "Ile Biten":
                                whereQuery = whereQuery + string.Format("AND UPPER({0}) LIKE UPPER('%{1}') ", flt.key, flt.val);
                                break;
                        }
                    }
                    else if (flt.filtervartype == "bool")
                    {
                        switch (flt.FilterTypes)
                        {
                            case "True":
                                whereQuery = whereQuery + string.Format("AND ({0} = True OR  '{0}' = '+')", flt.key);
                                break;
                            case "False":
                                whereQuery = whereQuery + string.Format("AND ({0} = False OR  '{0}' = '-')", flt.key);
                                break;
                            case "Boş":
                                whereQuery = whereQuery + string.Format("AND {0} IS NULL') ", flt.key);
                                break;
                            case "Boş Değil":
                                whereQuery = whereQuery + string.Format("AND {0} IS NOT NULL') ", flt.key);
                                break;
                        }
                    }
                }

                var remainingWhere = "";
                foreach (var flt in filterlst
                    .Where(x =>
                        x.key == "TMP_REMAINING_CD_TODAY"
                        || x.key == "TMP_REMAINING_HRS_TODAY"
                        || x.key == "TMP_REMAINING_CYC_TODAY"
                        || x.key == "TMP_REMAINING_CD_LAST_MV"
                        || x.key == "TMP_REMAINING_HRS_LAST_MV"
                        || x.key == "TMP_REMAINING_CYC_LAST_MV"))
                {
                    if (flt.key == "TMP_REMAINING_CD_TODAY" && !string.IsNullOrEmpty(flt.val))
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_TODAY = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_TODAY = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_TODAY <> {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_TODAY < {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_TODAY > {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_TODAY <= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_TODAY >= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Boş":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_TODAY IS NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                            case "Boş Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_TODAY IS NOT NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                        }
                    }
                    else if (flt.key == "TMP_REMAINING_HRS_TODAY" && !string.IsNullOrEmpty(flt.val))
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_TODAY = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_TODAY = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_TODAY <> {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_TODAY < {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_TODAY > {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_TODAY <= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_TODAY >= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Boş":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_TODAY IS NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                            case "Boş Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_TODAY IS NOT NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                        }
                    }
                    else if (flt.key == "TMP_REMAINING_CYC_TODAY" && !string.IsNullOrEmpty(flt.val))
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_TODAY = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_TODAY = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_TODAY <> {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_TODAY < {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_TODAY > {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_TODAY <= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_TODAY >= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Boş":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_TODAY IS NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                            case "Boş Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_TODAY IS NOT NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                        }
                    }
                    else if (flt.key == "TMP_REMAINING_CD_LAST_MV" && !string.IsNullOrEmpty(flt.val))
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_LAST_MV = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_LAST_MV = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_LAST_MV <> {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_LAST_MV < {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_LAST_MV > {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_LAST_MV <= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_LAST_MV >= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Boş":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_LAST_MV IS NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                            case "Boş Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CD_LAST_MV IS NOT NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                        }
                    }
                    else if (flt.key == "TMP_REMAINING_HRS_LAST_MV" && !string.IsNullOrEmpty(flt.val))
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_LAST_MV = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_LAST_MV = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_LAST_MV <> {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_LAST_MV < {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_LAST_MV > {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_LAST_MV <= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_LAST_MV >= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Boş":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_LAST_MV IS NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                            case "Boş Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_HRS_LAST_MV IS NOT NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                        }
                    }
                    else if (flt.key == "TMP_REMAINING_CYC_LAST_MV" && !string.IsNullOrEmpty(flt.val))
                    {
                        switch (flt.FilterTypes)
                        {
                            case "":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_LAST_MV = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_LAST_MV = {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Eşit Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_LAST_MV <> {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_LAST_MV < {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_LAST_MV > {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Küçük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_LAST_MV <= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Büyük Eşit":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_LAST_MV >= {1} ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""), flt.val);
                                break;
                            case "Boş":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_LAST_MV IS NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                            case "Boş Değil":
                                remainingWhere = string.Format(" {0} TMP_REMAINING_CYC_LAST_MV IS NOT NULL ", (!string.IsNullOrEmpty(remainingWhere) ? string.Format(" {0} OR ", remainingWhere) : ""));
                                break;
                        }
                    }
                }
                if (!string.IsNullOrEmpty(remainingWhere))
                {
                    whereQuery = whereQuery + string.Format(" AND ( {0} )", remainingWhere);
                }
            }
            return whereQuery;
        }
    }
}

