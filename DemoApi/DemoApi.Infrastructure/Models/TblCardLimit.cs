using System;
using System.Collections.Generic;

namespace DemoApi.Infrastructure.Models
{
    public partial class TblCardLimit
    {
        public int Id { get; set; }
        public int CardType { get; set; }
        public decimal CreditLimit { get; set; }

        public virtual TblCard CardTypeNavigation { get; set; }
    }
}
