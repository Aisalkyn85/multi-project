#!/bin/bash
dotnet test --logger "trx;LogFileName=Pi.Math.trx" dotnet-app/src/Pi.Math.Tests/Pi.Math.Tests.csproj
dotnet test --logger "trx;LogFileName=Pi.Runtime.trx" dotnet-app/src/Pi.Runtime.Tests/Pi.Runtime.Tests.csproj