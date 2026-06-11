# IG User - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-graph-api/reference/ig-user

# IG User

Represents an [Instagram Business Account](https://l.facebook.com/l.php?u=https%3A%2F%2Fhelp.instagram.com%2F502981923235522&h=AUDYNaMOSdJkqEjbclxBUdtNb9cUCLQamklrxBv0nSzeZ1mCT8ip_7m58J9LrKUz2ujUwNeFjBJXosa7AWZ_ZQpieYqLTR08WB2Bpx1Ln2RrSlZ3H1pzXGHCFsXBf9EoGh8gs5JH6RjL6RWk) or an [Instagram Creator Account](https://l.facebook.com/l.php?u=https%3A%2F%2Fhelp.instagram.com%2F1158274571010880&h=AUDQoriZx4bqOQP33xedycRdS0q8_bzs_vAaaezwLGz9z7NTgCQ4bTJHf-xWh9Y-KzJVDZOu_L5mUT6TelZbos-ecGW9Y3FQNBdOGr8ZU0QDt-etCxz--kx9BmudS22p2AbRSptyhlPNYGxo).

Throughout our documentation we use "Instagram User" and "Instagram Account" interchangeably. Both represent your app user's Instagram professional account.

### Requirements

| Instagram API with Instagram Login | Instagram API with Facebook Login || **Access Tokens** | - Instagram User user access token | - [Facebook User access token](facebook-login/access-tokens/.md#usertokens) |
| **Host URL** | `graph.instagram.com` | `graph.facebook.com` |
| **Login Type** | Business Login for Instagram | Facebook Login for Business |
| [**Permissions**](permissions/reference.md#i) | - `instagram_business_basic` | - `instagram_basic` - `pages_read_engagement`   If the app user was granted a role via the Business Manager on the [Page](instagram-api/overview.md#pages) connected to the targeted IG User, you will also need one of:   - `ads_management` - `ads_read`   If you are requesting the `shopping_product_tag_eligibility` field for [product tagging](instagram-api/guides/product-tagging.md), you will also need:   - `catalog_management` - `instagram_shopping_tag_products` |
| **[Business Roles](https://www.facebook.com/business/help/442345745885606)** | Not applicable. | If you are requesting the `shopping_product_tag_eligibility` field for [product tagging](instagram-api/guides/product-tagging.md), the app user must have an admin role on the [Business Manager](https://business.facebook.com/) that owns the IG User's [Instagram Shop](https://l.facebook.com/l.php?u=https%3A%2F%2Fhelp.instagram.com%2F1187859655048322&h=AUDXPz3fxt-EvgCZ8aYmfa5zL0VlRjO-OQYAqCTwRorYstwJs5YLxAk55uZu4nZlR0nL9RHPcYj8CkUn8G2ZHj7WdzpDqDQ2AY0ZFuqCtVWt-ihpJiEPnA6Pozy6Avy52nDDrlgjltUbKtG0). |
| **[Instagram Shop](https://l.facebook.com/l.php?u=https%3A%2F%2Fhelp.instagram.com%2F1187859655048322%2F&h=AUDFm_eMMBEmYyMOPFzGE3ayRTojHQMF-nw-13nMUuYXCr5qQmSfVHbOtVqEBkratbQhG2ki-MEynzJVEBLEPd06Xul2gFXfGEShdobBXwF694YOB96G-YB7rxXHPoWpWoTPCnQZvuqM1TrU)** | Not applicable. | If you are requesting the `shopping_product_tag_eligibility` field for [product tagging](instagram-api/guides/product-tagging.md), the IG User must have an approved [Instagram Shop](https://l.facebook.com/l.php?u=https%3A%2F%2Fhelp.instagram.com%2F1187859655048322%2F&h=AUASmT6itBDhOL2vipgZa4FO6NFg2OVn-RzkgzOOrq3hANn7u17GRXHCL31ZJflPvEoUr-OMeuTnI4pkEdcAo7Pjo9vqlCf3VBQspYsauGb1ld0MSYPvb4nThv0vdHLXKOUa2iM-K-_zRcZW) with a product catalog containing products. |
