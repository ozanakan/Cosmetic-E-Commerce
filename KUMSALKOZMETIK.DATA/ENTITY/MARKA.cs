using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KUMSALKOZMETIK.DATA.ENTITY
{
    public class MARKA
    {
        // Properties
        public virtual int? MA_ID { get; set; }
        public virtual string MA_CODE { get; set; } 
    }
    public sealed class MARKA_MAP : ClassMap<MARKA>
    {
        public MARKA_MAP()
        {
            Id(x => x.MA_ID).GeneratedBy.TriggerIdentity();
            Map(x => x.MA_CODE); 
        }
    }
}
