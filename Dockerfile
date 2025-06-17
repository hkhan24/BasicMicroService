# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# copy csproj and restore as separate layers
COPY BasicMicroservice/BasicMicroservice.csproj BasicMicroservice/
RUN dotnet restore BasicMicroservice/BasicMicroservice.csproj

# copy remaining source
COPY BasicMicroservice/ BasicMicroservice/
WORKDIR /src/BasicMicroservice

# publish app
RUN dotnet publish -c Release -o /app/publish /p:UseAppHost=false

# final runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "BasicMicroservice.dll"]
