FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder

WORKDIR /dotnet-app/src
COPY dotnet-app/src/Pi.Math/Pi.Math.csproj ./Pi.Math/
COPY dotnet-app/src/Pi.Runtime/Pi.Runtime.csproj ./Pi.Runtime/
COPY dotnet-app/src/Pi.Web/Pi.Web.csproj ./Pi.Web/

WORKDIR /dotnet-app/src/Pi.Web
RUN dotnet restore

# app image
FROM mcr.microsoft.com/dotnet/aspnet:7.0

EXPOSE 80
ENTRYPOINT ["dotnet", "Pi.Web.dll"]
CMD ["-m", "console", "-dp", "6"]
