# Ad Adrules Governed

Source: https://developers.facebook.com/docs/graph-api/reference/adgroup/adrules_governed

# Ad Adrules Governed

Updated: May 21, 2019

## Reading

Ad rules that govern this ad - by default, this only returns rules that either directly mention the ad by id or indirectly through the set entity\_type

#### Example

Select language

HTTPPHP SDKJavaScript SDKAndroid SDKiOS SDK

---

```
GET /v25.0/{ad-id}/adrules_governed HTTP/1.1
Host: graph.facebook.com
```

Try it in [Graph API Explorer](/tools/explorer/?method=GET&path=%7Bad-id%7D%2Fadrules_governed&version=v25.0)

If you want to learn how to use the Graph API, read our [Using Graph API guide](graph-api/using-graph-api.md)

#### Parameters

| Parameter | Description |
| --- | --- |
| `pass_evaluation` *boolean* | If set, this will further filter the rules to only include those for which the ad would evaluate to the boolean value of this param |

#### Fields

Reading from this edge will return a JSON formatted result:

```
{
"data": [],
"paging": {}
}
```

##### data

A list of [AdRule](marketing-api/reference/ad-rule.md) nodes.

##### paging

For more details about pagination, see the [Graph API guide](graph-api/using-graph-api.md#paging).

#### Error Codes

| Error Code | Description |
| --- | --- |
| 104 | Incorrect signature |

## Creating

You can't perform this operation on this endpoint.

## Updating

You can't perform this operation on this endpoint.

## Deleting

You can't perform this operation on this endpoint.
