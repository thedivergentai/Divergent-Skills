# Access Levels - App Development with Meta

Source: https://developers.facebook.com/docs/graph-api/overview/access-levels

# Access Levels

This document is only applicable to apps created using an App Type.

**[Advanced Access](graph-api/overview/access-levels.md#advanced-access) now requires Business Verification**

As of February 1, 2023 apps requesting [advanced access](graph-api/overview/access-levels.md#advanced-access) for permissions may have to be connected to a verified business. [See this blog post for more information.](https://developers.facebook.com/blog/post/2023/02/01/developer-platform-requiring-business-verification-for-advanced-access/)

Access levels are an additional layer of Graph API authorization that apply to [permissions](permissions/reference.md) and [features](apps/features-reference.md) for [Business](development/create-an-app/app-dashboard/app-types.md#business), [Consumer](development/create-an-app/app-dashboard/app-types.md#consumer), and [Gaming](development/create-an-app/app-dashboard/app-types.md#gaming-services) apps.

There are two access levels: [Standard](#standard-access) and [Advanced](#advanced-access). Apps can request permissions with Advanced Access from any app user, and features with Advanced Access are active for all app users. Permissions with Standard Access, however, can only be requested from app users who have a role on the requesting app, and features with Standard Access are only active for app users who have a role on the app.

If your app will only be used by people who have a role on it, the permissions and features your app requires will only need Standard Access. If your app will be used by people who do not have a role on it, the permissions and features that your app requires will need Advanced Access.

All Business, Consumer, and Gaming apps are automatically approved for Standard Access for all permissions and features. Advanced Access, however, must be approved on an individual permission and feature basis through the [App Review](app-review.md) process.
