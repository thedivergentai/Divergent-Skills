# Ad Creative

Source: https://developers.facebook.com/docs/graph-api/reference/adgroup/adcreatives

# Ad Creative

Updated: Jun 28, 2019

Contains content for an ad, including images, videos and so on.

## Reading

#### Example

Select language

HTTPPHP SDKJavaScript SDKAndroid SDKiOS SDK

---

```
GET /v25.0/{ad-id}/adcreatives HTTP/1.1
Host: graph.facebook.com
```

Try it in [Graph API Explorer](/tools/explorer/?method=GET&path=%7Bad-id%7D%2Fadcreatives&version=v25.0)

If you want to learn how to use the Graph API, read our [Using Graph API guide](graph-api/using-graph-api.md)

#### Parameters

This endpoint doesn't have any parameters.

#### Fields

Reading from this edge will return a JSON formatted result:

```
{
"data": [],
"paging": {}
}
```

##### data

A list of [AdCreative](/documentation/ads-commerce/marketing-api/reference/ad-creative) nodes.

##### paging

For more details about pagination, see the [Graph API guide](graph-api/using-graph-api.md#paging).

#### Error Codes

| Error Code | Description |
| --- | --- |
| 100 | Invalid parameter |
| 80004 | There have been too many calls to this ad-account. Wait a bit and try again. For more info, please refer to /docs/graph-api/overview/rate-limiting#ads-management. |
| 190 | Invalid OAuth 2.0 Access Token |
| 104 | Incorrect signature |
| 2500 | Error parsing graph query |

## Creating

You can't perform this operation on this endpoint.

## Updating

You can't perform this operation on this endpoint.

## Deleting

You can't perform this operation on this endpoint.
