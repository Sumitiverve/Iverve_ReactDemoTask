using System;
using System.Collections.Generic;
using System.Text;

namespace DemoApi.Core.Models
{
    public class Card
    {
        public int Id { get; set; }
        public string CardType { get; set; }
    }

    public class CardDetails
    {
        public string CardType { get; set; }
        public decimal AnnualCharge { get; set; }
        public decimal CardLimit { get; set; }
    }
}
