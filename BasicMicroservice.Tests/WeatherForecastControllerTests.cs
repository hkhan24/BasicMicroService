using BasicMicroservice.Controllers;
using Microsoft.Extensions.Logging.Abstractions;
using Xunit;

namespace BasicMicroservice.Tests;

public class WeatherForecastControllerTests
{
    [Fact]
    public void Get_ReturnsFiveForecasts()
    {
        var logger = NullLogger<WeatherForecastController>.Instance;
        var controller = new WeatherForecastController(logger);

        var forecasts = controller.Get();

        Assert.Equal(5, forecasts.Count());
    }
}
