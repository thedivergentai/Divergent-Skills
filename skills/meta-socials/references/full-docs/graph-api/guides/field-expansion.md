# Field Expansion - Graph API

Source: https://developers.facebook.com/docs/graph-api/guides/field-expansion

# Field Expansion

If you test the `GET /me/feed` query in the Graph API Explorer, you will noticed that the request returned many objects and paginated the results. This is common for most edges.

#### Example Response

```
{
"data": [
{
"created_time": "2021-04-30T01:37:07+0000",
"message": "I'll never forget it has a head.",
"id": "10211998223264288_10222340566616408"
},
...
{
"created_time": "2021-04-25T22:29:26+0000",
"message": "Things you hear at my house: \"I accidentally made a cake.\"",
"id": "10211998223264288_10222314489524497"
}
],
"paging": {
"previous": "https://graph.facebook.com/<API_VERSION>/<USER_ID>/feed?access_token=<ACCESS-TOKEN>&pretty=0&__previous=1&since=1627322627&until&__paging_token=enc_AdB2fX...",
"next": "https://graph.facebook.com/<API_VERSION>/<USER_ID>/feed?access_token=<ACCESS-TOKEN>&pretty=0&until=1619389766&since&__paging_token=enc_AdAamX...&__previous"
}
}
```

Field expansion allows you not only to limit the number of objects returned but also perform nested requests.
