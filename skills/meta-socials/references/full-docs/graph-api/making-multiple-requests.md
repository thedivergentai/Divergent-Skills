# Batch Requests - Graph API

Source: https://developers.facebook.com/docs/graph-api/making-multiple-requests

# Batch Requests

Send a single HTTP request that contains multiple Facebook Graph API calls. Independent operations are processed in parallel while dependent operations are processed sequentially. Once all operations are complete, a consolidated response is passed back to you and the HTTP connection is closed.

The ordering of responses correspond with the ordering of operations in the request. You should process responses accordingly to determine which operations were successful and which should be retried in a subsequent operation.

### Limitations

- Batch requests are limited to 50 requests per batch. Each call within the batch is counted separately for the purposes of calculating API call limits and resource limits. For example, a batch of 10 API calls will count as 10 calls and each call within the batch contributes to CPU resource limits in the same manner. Please see our [Rate Limiting Guide](graph-api/overview/rate-limiting.md) for more information.
- Batch requests cannot include multiple [Adsets](marketing-api/reference/ad-campaign.md) under the same [Campaign](marketing-api/reference/ad-campaign-group.md). Learn more about [batching Marketing API requests](marketing-api/asyncrequests.md).
