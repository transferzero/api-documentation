---
title: .NET SDK (C# / VB.NET)
permalink: /docs/sdk-dotnet/
---

- NuGet Package: <https://www.nuget.org/packages/TransferZero.Sdk/>
- Git Repository: <https://github.com/transferzero/transferzero-sdk-dotnet>

# Example

A small example illustrating authenticating and accessing the Currency Info endpoint:

## C#

```csharp
using System;
using System.Diagnostics;
using TransferZero.Sdk.Api;
using TransferZero.Sdk.Client;
using TransferZero.Sdk.Model;

namespace Example
{
    public class InfoCurrenciesExample
    {
        public void main()
        {
            Configuration configuration = new Configuration();
            configuration.ApiKey = "<key>";
            configuration.ApiSecret = "<secret>";
            configuration.BasePath = "https://api-sandbox.transferzero.com/v1";

            var apiInstance = new CurrencyInfoApi(configuration);

            try {
                // Getting a list of possible requested currencies
                CurrencyListResponse result = apiInstance.InfoCurrencies();
                Debug.WriteLine(result);
            } catch (ApiException e)
            {
                if (e.IsValidationError) {
                    // In case there was a validation error, obtain the object
                    CurrencyListResponse result = e.ParseObject<CurrencyListResponse>();
                    Debug.WriteLing("There was a validation error while processing!");
                    Debug.WriteLine(result);
                } else {
                    Debug.Print("Exception when calling CurrencyInfoApi.InfoCurrencies: " + e.Message );
                }
            }
        }
    }
```

## VB.NET

```vb
Imports TransferZero.Sdk.Api;
Imports TransferZero.Sdk.Client;
Imports TransferZero.Sdk.Model;
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports System.Threading.Tasks

Module Example
    Sub Main(ByVal args As String())
        Dim configuration As Configuration = New Configuration()
        configuration.ApiKey = "KEY"
        configuration.ApiSecret = "SECRET"
        configuration.BasePath = "https://api-sandbox.transferzero.com/v1"

        Dim debitsApi As AccountDebitsApi = New AccountDebitsApi(configuration)

        Dim apiInstance = new CurrencyInfoApi(configuration)


        Try
            REM Getting a list of possible requested currencies
            Dim result As CurrencyListResponse = apiInstance.InfoCurrencies()
            Debug.WriteLine(result)
        Catch e as ApiException
            If e.IsValidationError Then
                REM In case there was a validation error, obtain the object
                Dim result as CurrencyListResponse = e.ParseObject(Of CurrencyListResponse)()
                Debug.WriteLine("There was a validation error while processing!")
                Debug.WriteLine(result)
            Else
                Debug.Print("Exception when calling CurrencyInfoApi.InfoCurrencies: " + e.Message )
            End If
        End Try
    End Sub
End Module
```
Full examples for all steps required by our [quick integration guide]({{ "/docs/quick-integration/" | prepend: site.baseurl }}) can be found at: <https://github.com/transferzero/transferzero-sdk-dotnet/tree/master/examples>
