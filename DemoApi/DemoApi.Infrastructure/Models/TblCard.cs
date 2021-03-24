using System;
using System.Collections.Generic;

namespace DemoApi.Infrastructure.Models
{
    public partial class TblCard
    {
        public TblCard()
        {
            TblCardAnnualCharge = new HashSet<TblCardAnnualCharge>();
            TblCardLimit = new HashSet<TblCardLimit>();
        }

        public int Id { get; set; }
        public string CardType { get; set; }

        public virtual ICollection<TblCardAnnualCharge> TblCardAnnualCharge { get; set; }
        public virtual ICollection<TblCardLimit> TblCardLimit { get; set; }
    }
}
