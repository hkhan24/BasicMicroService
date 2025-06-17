using BasicMicroservice.Services;
using Xunit;

namespace BasicMicroservice.Tests;

public class CalculationServiceTests
{
    [Fact]
    public void Add_ReturnsSumOfNumbers()
    {
        var service = new CalculationService();

        double result = service.Add(2, 3);

        Assert.Equal(5, result);
    }
}
