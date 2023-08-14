# Use the official ASP.NET Core runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Use the SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["BasicMicroservice/BasicMicroservice.csproj", "BasicMicroservice/"]
RUN dotnet restore "BasicMicroservice/BasicMicroservice.csproj"

WORKDIR "/src/BasicMicroservice"
COPY . .
RUN dotnet build "BasicMicroservice.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "BasicMicroservice.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BasicMicroservice.dll"]
