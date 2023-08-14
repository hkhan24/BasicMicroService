ARG VERSION=6.0-alpine
FROM mcr.microsoft.com/dotnet/sdk:${VERSION} AS build


ADD BasicMicroservice /app/BasicMicroservice

WORKDIR /app/BasicMicroservice
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:${VERSION} AS runtime

WORKDIR /app/BasicMicroservice
COPY --from=build /app/BasicMicroservice/out ./
ENTRYPOINT ["dotnet", "BasicMicroservice.dll"]
