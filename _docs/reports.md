---
title: Reports API
permalink: /docs/reports-api/
---

* Table of contents
{:toc}

<div class="alert alert-info"><b>Note!</b> Every API call needs to be authenticated. See the <a href="{{ "/docs/authentication/" | prepend: site.baseurl }}" class="alert-link">Authentication section</a> for more details on the authentication process.</div>

## Available reports
To retrieve a list of available reports, make a `GET` request to `https://report-engine.transferzero.com/reports`, which can take the following **optional** querystring values:

* `type=transaction` or `account`
* `environment=test` or `live`

```
https://report-engine.transferzero.com/reports?type=transaction&environment=test
```

<div class="alert alert-info"><b>Note!</b> The complete URL - including querystrings - is required when generating the `Authorization-Signature`.</div>

You should then receive a response containing a list of reports available for download - example below:

{% capture data-list-response %}
```json
{
    "available_reports": [
        "live/UUID/monthly/transaction_report_2021-03.csv",
        "live/UUID/monthly/transaction_report_2021-04.csv"
    ]
}
```
{% endcapture %}
{% include language-tabbar.html prefix="auth-structure" raw=data-list-response %}

## Downloading a report
Now make a `POST` request to `https://report-engine.transferzero.com/authenticated_url`, with the body as the file name of the report you want to access:

{% capture data-path-response %}
```json
{
  "path":"live/UUID/monthly/transaction_report_2018-02.csv"
}
```
{% endcapture %}
{% include language-tabbar.html prefix="auth-structure" raw=data-path-response %}

This will return a time-sensitive URL, valid for 10 minutes - see example:

{% capture data-authenticated-url-response %}
```json
{
    "authenticated_url": "..."
}
```
{% endcapture %}
{% include language-tabbar.html raw=data-authenticated-url-response %}

Either open this URL in a browser window or make a HTTP `GET` request to download, you should now be able to access the data in the report.
