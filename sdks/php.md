# PHP SDK

- Composer Package: https://packagist.org/packages/transferzero/transferzero-php-sdk
- Git Repository: https://github.com/transferzero/transferzero-sdk-php

## Example

A small example illustrating authenticating and accessing the Currency Info endpoint:

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');

// Set the API Key and Secret on the Configuration object for authentication:
TransferZero\Configuration::getDefaultConfiguration()
  ->setHost("https://api-sandbox.transferzero.com/v1")
  ->setApiKey("<key>")
  ->setApiSecret("<secret>");

$apiInstance = new TransferZero\Api\CurrencyInfoApi();

try {
    $result = $apiInstance->infoCurrencies();
    print_r($result);
} catch (Exception $e) {
    if ($e->isValidationError()) {
        $response = $e->getResponseObject();
        echo "Validation error(s) occurred when calling the endpoint";
        print_r($response);
    } else {
        echo "An exception occurred when calling CurrencyInfoApi#infoCurrencies";
        echo $e->getMessage();
    }
}
?>
```

Full examples for all steps required by our [quick integration guide](../quick-integration.md) can be found at: https://github.com/transferzero/transferzero-sdk-php/blob/master/examples/client.php
