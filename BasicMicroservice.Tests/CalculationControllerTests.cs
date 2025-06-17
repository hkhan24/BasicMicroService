using BasicMicroservice.Controllers;
using BasicMicroservice.Models;
using Microsoft.AspNetCore.Mvc;
using Xunit;

namespace BasicMicroservice.Tests;

public class CalculationControllerTests
{
    [Fact]
    public void Add_ReturnsOkWithSum()
    {
        var controller = new CalculationController();
        var input = new NumberInput { Number1 = 4, Number2 = 6 };

        var result = controller.Add(input) as OkObjectResult;

        Assert.NotNull(result);
        Assert.Equal(10.0, result!.Value);
    }
}
