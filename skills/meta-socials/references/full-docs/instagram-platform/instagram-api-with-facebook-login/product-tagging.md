# Product Tagging - Instagram Platform

Source: https://developers.facebook.com/docs/instagram-platform/instagram-api-with-facebook-login/product-tagging

# Product Tagging

You can use the Instagram Graph API to create and manage [Instagram Shopping Product Tags](https://l.facebook.com/l.php?u=https%3A%2F%2Fhelp.instagram.com%2F2022466637835789&h=AUCY2hvufceyuW6iiMSv1f0MgV9vMqaDB-yc14gE0x5LPhGx_IF0j0qwrWbtqwpW0wT1XDbVCsftR-QPB1zwBBPUwFLwgtgrEvWHEwmG9SlUCm_5doBFsineVBBoihElyUM3-Gf3Sya-K6n7) on an Instagram Business's [IG Media](instagram-api/reference/ig-media.md).

**Note:** Beginning August 10, 2023, some businesses without checkout-enabled Shops will no longer be able to tag their products using the Content Publishing API. This will impact both API and native interfaces, and will remove tags to products from previous posts.Customers will still be able to tag products from Shops with checkout enabled on Facebook and Instagram. You can still refer to `shopping_product_tag_eligibility` field to check if an Instagram account is eligible to tag their products using Content Publishing API.

The general flow for tagging products is:

1. Check if the Instagram Business is [eligible for product tagging](#get-eligibility).
2. If the Instagram Business is eligible, [get its product catalogs](#get-available-catalogs).
3. [Search each catalog for products](#get-catalog-products) that are eligible for tagging.
4. [Create a tagged media container](#post-media).
5. [Publish the tagged media container](#post-media-publish).
