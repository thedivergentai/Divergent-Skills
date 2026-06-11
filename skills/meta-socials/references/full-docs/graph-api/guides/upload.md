# Upload a File or Video - Video API

Source: https://developers.facebook.com/docs/graph-api/guides/upload

# Upload a file

The Resumable Upload API allows you to upload large files to Meta's social graph and resume interrupted upload sessions without having to start over. Once you have uploaded your file, you can publish it.

References for endpoints that support uploaded file handles will indicate if the endpoints support handles returned by the Resumable Upload API.

### Before you start

This guide assumes you have read the [Graph API Overview](graph-api/overview.md) and the [Meta Development](development.md) guides and performed the necessary actions needed to develop with Meta.

You will need:

- A Meta app ID
- A file in one of the following formats:
  - `pdf`
  - `jpeg`
  - `jpg`
  - `png`
  - `mp4`
- A User access token
