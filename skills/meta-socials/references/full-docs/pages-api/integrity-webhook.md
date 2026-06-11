# Page Integrity API & Webhook - Facebook Pages API

Source: https://developers.facebook.com/docs/pages-api/integrity-webhook

# Page Integrity API & Webhook

As pages interact with users on various Meta apps, Meta may
[flag pages for violating](https://l.facebook.com/l.php?u=https%3A%2F%2Ftransparency.meta.com%2Fenforcement%2Fdetecting-violations%2F&h=AUAvqTG3khRwJyNZ7RDFjIAAFnIMIRWAHzsqPVE00GpaJ0CtOSWcHNj-EeXzWMGKbqvehg5WwW-ylYh6nbRdCgN5kTGDbglyoyS23CWwetZyriqwSu0yePx3m7bEqqmvlevXyunKiV0aLBRI)
the various
[community standards](https://l.facebook.com/l.php?u=https%3A%2F%2Ftransparency.meta.com%2Fpolicies%2Fcommunity-standards%2F&h=AUAtXByVwGX1ywMz4cggG1pTOOQ1rj0T_HOP4hXShrlJGoqnpWnxNwz4KG7Okoh3UPi6q0nFzBk0ZEuIX4BN1BDWRGvDiIfb0rdAHaGK6WGc5xu7VFWBv07nR7GLiHb5X9rCvbfdZQYklcL1)
and other
[policies](https://l.facebook.com/l.php?u=https%3A%2F%2Ftransparency.meta.com%2Fpolicies%2F&h=AUCVopbTX-tsIBOxeMSTiNRZE7PTNehEn68RTwuTQzMxeAkJfloYQoRmgMNxVT7tD4DxJCJcmVr0znlx8LcdaFBowUfUdqM_q55qnR0KcWXvu595Fl7UM9j2rlYgdjl20Yu_slnsSOmN41Gw).
When violations are detected, Meta may warn or restrict pages from performing various actions. Restrictions may range from not being able to change the name of a page for a few days to more severe ones, such as being unable to message users, use Meta platform APIs, or having the page completely disabled and unpublished.

The APIs documented in this page provide apps with API access to the integrity status of a page, any violation(s) for which a page has been flagged, restrictions that Meta has applied because of the violation(s), along with recommended material to educate the page administrators on the violation, restriction, what actions they can take to resolve the restriction, and how to prevent them in the future.
