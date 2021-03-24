using DemoApi.Core.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DemoApi.Core.Interfaces.Repositories
{
    public interface ICardRepository
    {
        Task<List<Card>> GetCardList();
        Task<CardDetails> GetCardDetails(int CardId);
    }
}
