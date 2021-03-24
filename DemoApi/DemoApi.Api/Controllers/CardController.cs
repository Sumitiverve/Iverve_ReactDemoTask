using DemoApi.Core.Interfaces.Repositories;
using DemoApi.Core.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DemoApi.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CardController : ControllerBase
    {
        private readonly ICardRepository _cardRepository;

        public CardController(ICardRepository cardRepository)
        {
            _cardRepository = cardRepository;
        }

        [HttpGet]
        [Route("GetCardList")]
        public async Task<List<Card>> GetCardListAsync()
        {
            List<Card> cards = await _cardRepository.GetCardList();
            return cards;
        }

        [HttpGet]
        [Route("GetCardDetails/{CardId}")]
        public async Task<CardDetails> GetCardDetails(int CardId)
        {
            CardDetails cardDetails = await _cardRepository.GetCardDetails(CardId);
            return cardDetails;
        }
    }
}