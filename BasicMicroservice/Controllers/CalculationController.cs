using Microsoft.AspNetCore.Mvc;
using BasicMicroservice.Models;
using BasicMicroservice.Services;

namespace BasicMicroservice.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CalculationController : ControllerBase
    {
        private readonly CalculationService _calculationService;

        public CalculationController()
        {
            _calculationService = new CalculationService();
        }

        [HttpPost("add")]
        public IActionResult Add([FromBody] NumberInput numbers)
        {
            var result = _calculationService.Add(numbers.Number1, numbers.Number2);
            return Ok(result);
        }
    }
}