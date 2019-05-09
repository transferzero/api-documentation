# Javascript SDK

- NPM Package: https://www.npmjs.com/package/transferzero-sdk
- Git Repository: https://github.com/transferzero/transferzero-sdk-javascript

## Example

A small example illustrating authenticating and accessing the Currency Info endpoint:

```js
import { CurrencyInfoApi } from 'transferzero-sdk';

// Configure API key authorization
const apiClient = new ApiClient();
apiClient.apiKey = '<key>';
apiClient.apiSecret = '<secret>';
apiClient.basePath = 'https://api-sandbox.transferzero.com/v1';

let apiInstance = new CurrencyInfoApi(apiClient);
apiInstance.infoCurrencies().then((data) => {
  console.log('API called successfully. Returned data: ' + data);
}, (error) => {
  if (error.isValidationError) {
    let result = error.getResponseObject();
    console.log(result);
    console.error("WARN: Validation error occurred when calling the endpoint");
  } else {
    console.error("Exception when calling CurrencyInfoApi#infoCurrencies");
    throw error;
  }
});
```

Full examples for all steps required by our [quick integration guide](../quick-integration.md) can be found at: https://github.com/transferzero/transferzero-sdk-javascript/blob/master/examples/examples.js
