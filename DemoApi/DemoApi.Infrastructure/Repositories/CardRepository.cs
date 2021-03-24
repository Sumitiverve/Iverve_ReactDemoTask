using DemoApi.Core.Interfaces.Repositories;
using DemoApi.Core.Models;
using DemoApi.Infrastructure.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApi.Infrastructure.Repositories
{
    public class CardRepository : ICardRepository
    {
        private readonly React_DemoContext _DemoContext;

        public CardRepository(React_DemoContext react_DemoContext)
        {
            _DemoContext = react_DemoContext;
        }

        public async Task<CardDetails> GetCardDetails(int CardId)
        {
            var tblCardDetails = _DemoContext.TblCard.Include("TblCardAnnualCharge").Include("TblCardLimit").Where(_ => _.Id.Equals(CardId)).FirstOrDefault();
            var cardDetails = new CardDetails
            {
                CardType = tblCardDetails.CardType,
                AnnualCharge = tblCardDetails.TblCardAnnualCharge.FirstOrDefault().AnnualCharge,
                CardLimit = tblCardDetails.TblCardLimit.FirstOrDefault().CreditLimit,
            };
            return cardDetails;
        }

        public async Task<List<Card>> GetCardList()
        {
            List<Card> cards = new List<Card>();
            var tblCards = await _DemoContext.TblCard.ToListAsync();
            foreach (var item in tblCards)
            {
                cards.Add(new Card
                {
                    Id = item.Id,
                    CardType = item.CardType
                });
            }
            return cards;
        }
    }
}
