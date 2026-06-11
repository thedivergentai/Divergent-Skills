# Rate Limits - Graph API

Source: https://developers.facebook.com/docs/graph-api/advanced/rate-limiting

# Rate Limits

A rate limit is the number of API calls an app or user can make within a given time period. If this limit is exceeded or if CPU or total time limits are exceeded, the app or user may be throttled. API requests made by a throttled user or app will fail.

All API requests are subject to rate limits. Graph API requests are subject to [Platform Rate Limits](#platform-rate-limits), while Marketing API and Instagram Platform requests are subject to [Business Use Case (BUC) Rate Limits](#buc-rate-limits).

Pages API requests are subject to either Platform or BUC Rate Limits, depending on the token used in the request; requests made with
[application](https://developers.facebook.com/docs/facebook-login/access-tokens#apptokens) or
[user access tokens](https://developers.facebook.com/docs/facebook-login/access-tokens#usertokens) are subject to Platform Rate Limits, while requests made with
[system user](https://developers.facebook.com/docs/marketing-api/businessmanager/systemuser#generate-token) or
[page access tokens](https://developers.facebook.com/docs/facebook-login/access-tokens#pagetokens) are subject to Business Use Case Rate Limits.

Real time rate limit usage statistics are described in headers that are included with most API responses once enough calls have been made to an endpoint. Platform Rate Limit usage statistics are also displayed in the [App Dashboard](https://developers.facebook.com/apps/). Once a rate limit is reached, any subsequent requests made by your app will fail and the API will return an error code until enough time has passed for the call count to drop below the limit.

If both Platform and Business Use Case rate limits can be applied to a request, BUC rate limits will be applied.
