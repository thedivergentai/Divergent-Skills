# Ad Leads

Source: https://developers.facebook.com/docs/graph-api/reference/adgroup/leads

# Ad Leads

Updated: Nov 4, 2024

Any leads associated with with a Lead Ad. Since these leads belong to a business' Page, not the ad itself, you need to be a Page Admin to access these. Alternately you can have permissions granted to you by the Page Admin. See [Retrieving Leads](/documentation/ads-commerce/marketing-api/guides/lead-ads/retrieving).

## Reading

GraphAdgroupLeadsEdge

#### Example

Select language

HTTPPHP SDKJavaScript SDKAndroid SDKiOS SDKcURL

---

```
GET /v25.0/{adgroup-id}/leads HTTP/1.1
Host: graph.facebook.com
```

Try it in [Graph API Explorer](/tools/explorer/?method=GET&path=%7Badgroup-id%7D%2Fleads&version=v25.0)

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

A list of [UserLeadGenInfo](marketing-api/reference/user-lead-gen-info.md) nodes.

##### paging

For more details about pagination, see the [Graph API guide](graph-api/using-graph-api.md#paging).

#### Error Codes

| Error Code | Description |
| --- | --- |
| 80004 | There have been too many calls to this ad-account. Wait a bit and try again. For more info, please refer to /docs/graph-api/overview/rate-limiting#ads-management. |
| 100 | Invalid parameter |
| 190 | Invalid OAuth 2.0 Access Token |
| 104 | Incorrect signature |

## Creating

## Updating

You can't perform this operation on this endpoint.

## Deleting

You can't perform this operation on this endpoint.
