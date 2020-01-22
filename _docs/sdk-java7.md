---
title: Java 7 SDK
permalink: /docs/sdk-java7/
---

- Maven Artifact: <https://search.maven.org/artifact/com.transferzero.sdk/transferzero-sdk-java7>
- Git Repository: <https://github.com/transferzero/transferzero-sdk-java7>

# Example

A small example illustrating authenticating and accessing the Currency Info endpoint:

```java
// Import classes:
import com.transferzero.sdk.ApiClient;
import com.transferzero.sdk.ApiException;
import com.transferzero.sdk.Configuration;
import com.transferzero.sdk.auth.*;
import com.transferzero.sdk.api.CurrencyInfoApi;

ApiClient apiClient = new ApiClient();
apiClient.setApiKey("<key>");
apiClient.setApiSecret("<secret>");
apiClient.setBasePath("https://api-sandbox.transferzero.com/v1");

CurrencyInfoApi apiInstance = new CurrencyInfoApi(apiClient);
try {
    CurrencyListResponse result = apiInstance.infoCurrencies();
    System.out.println(result);
} catch (ApiException e) {
    if (e.isValidationError()) {
        CurrencyListResponse result = e.getResponseObject(CurrencyListResponse.class);
        System.out.println(result);
        System.err.println("WARN: Validation error occurred when calling the endpoint");
    } else {
        System.err.println("Exception when calling CurrencyInfoApi#infoCurrencies");
        e.printStackTrace();
    }
}
```

Full examples for all steps required by our [quick integration guide]({{ "/docs/quick-integration/" | prepend: site.baseurl }}) can be found at: https://github.com/transferzero/transferzero-sdk-java7/blob/master/example/src/main/java/com/transferzero/test/Application.java
