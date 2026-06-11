# WeasyPrint 69.0 documentation

Source: https://doc.courtbouillon.org/weasyprint/stable/index.html

# WeasyPrint

**The Awesome Document Factory**

WeasyPrint is a smart solution helping web developers to create PDF
documents. It turns simple HTML pages into gorgeous statistical reports,
invoices, tickets…

From a technical point of view, WeasyPrint is a visual rendering engine for
HTML and CSS that can export to PDF. It aims to support web standards for
printing. WeasyPrint is free software made available under a BSD license.

It is based on various libraries but *not* on a full rendering engine like
WebKit or Gecko. The CSS layout engine is written in Python, designed for
pagination, and meant to be easy to hack on.

- Free software: BSD license
- For Python 3.10+, tested on CPython and PyPy
- Documentation: <https://doc.courtbouillon.org/weasyprint>
- Examples: <https://weasyprint.org/#samples>
- Changelog: <https://github.com/Kozea/WeasyPrint/releases>
- Code, issues, tests: <https://github.com/Kozea/WeasyPrint>
- Code of conduct: <https://www.courtbouillon.org/code-of-conduct>
- Professional support: <https://www.courtbouillon.org>
- Donation: <https://opencollective.com/courtbouillon>

WeasyPrint has been created and developed by Kozea (<https://kozea.fr/>).
Professional support, maintenance and community management is provided by
CourtBouillon (<https://www.courtbouillon.org/>).

Copyrights are retained by their contributors, no copyright assignment is
required to contribute to WeasyPrint. Unless explicitly stated otherwise, any
contribution intentionally submitted for inclusion is licensed under the BSD
3-clause license, without any additional terms or conditions. For full
authorship information, see the version control history.

Documentation

- [First Steps](first_steps.md)
  - [Installation](first_steps.md#installation)
  - [Command-Line](first_steps.md#command-line)
  - [Python Library](first_steps.md#python-library)
  - [Security](first_steps.md#security)
- [Common Use Cases](common_use_cases.md)
  - [Include in Web Applications](common_use_cases.md#include-in-web-applications)
  - [Adjust Document Dimensions](common_use_cases.md#adjust-document-dimensions)
  - [Generate Specialized PDFs](common_use_cases.md#generate-specialized-pdfs)
  - [Include PDF Forms](common_use_cases.md#include-pdf-forms)
  - [Define PDF Metadata](common_use_cases.md#define-pdf-metadata)
  - [Attach Files](common_use_cases.md#attach-files)
  - [Cache and Optimize Images](common_use_cases.md#cache-and-optimize-images)
  - [Improve Rendering Speed and Memory Use](common_use_cases.md#improve-rendering-speed-and-memory-use)
  - [Show Log Messages](common_use_cases.md#show-log-messages)
- [API Reference](api_reference.md)
  - [API Stability](api_reference.md#api-stability)
  - [Versioning](api_reference.md#versioning)
  - [Command-line API](api_reference.md#command-line-api)
  - [Python API](api_reference.md#python-api)
  - [Supported Features](api_reference.md#supported-features)
- [Going Further](going_further.md)
  - [Why WeasyPrint?](going_further.md#why-weasyprint)
  - [Why Python?](going_further.md#why-python)
  - [Dive into the Source](going_further.md#dive-into-the-source)

Extra Information

- [Changelog](changelog.md)
  - [Version 69.0](changelog.md#version-69-0)
  - [Version 68.1](changelog.md#version-68-1)
  - [Version 68.0](changelog.md#version-68-0)
  - [Version 67.0](changelog.md#version-67-0)
  - [Version 66.0](changelog.md#version-66-0)
  - [Version 65.1](changelog.md#version-65-1)
  - [Version 65.0](changelog.md#version-65-0)
  - [Version 64.1](changelog.md#version-64-1)
  - [Version 64.0](changelog.md#version-64-0)
  - [Version 63.1](changelog.md#version-63-1)
  - [Version 63.0](changelog.md#version-63-0)
  - [Version 62.3](changelog.md#version-62-3)
  - [Version 62.2](changelog.md#version-62-2)
  - [Version 62.1](changelog.md#version-62-1)
  - [Version 62.0](changelog.md#version-62-0)
  - [Version 61.2](changelog.md#version-61-2)
  - [Version 61.1](changelog.md#version-61-1)
  - [Version 61.0](changelog.md#version-61-0)
  - [Version 60.2](changelog.md#version-60-2)
  - [Version 60.1](changelog.md#version-60-1)
  - [Version 60.0](changelog.md#version-60-0)
  - [Version 59.0](changelog.md#version-59-0)
  - [Version 59.0b1](changelog.md#version-59-0b1)
  - [Version 58.1](changelog.md#version-58-1)
  - [Version 58.0](changelog.md#version-58-0)
  - [Version 58.0b1](changelog.md#version-58-0b1)
  - [Version 57.2](changelog.md#version-57-2)
  - [Version 57.1](changelog.md#version-57-1)
  - [Version 57.0](changelog.md#version-57-0)
  - [Version 57.0b1](changelog.md#version-57-0b1)
  - [Version 56.1](changelog.md#version-56-1)
  - [Version 56.0](changelog.md#version-56-0)
  - [Version 56.0b1](changelog.md#version-56-0b1)
  - [Version 55.0](changelog.md#version-55-0)
  - [Version 55.0b1](changelog.md#version-55-0b1)
  - [Version 54.3](changelog.md#version-54-3)
  - [Version 54.2](changelog.md#version-54-2)
  - [Version 54.1](changelog.md#version-54-1)
  - [Version 54.0](changelog.md#version-54-0)
  - [Version 54.0b1](changelog.md#version-54-0b1)
  - [Version 53.4](changelog.md#version-53-4)
  - [Version 53.3](changelog.md#version-53-3)
  - [Version 53.2](changelog.md#version-53-2)
  - [Version 53.1](changelog.md#version-53-1)
  - [Version 53.0](changelog.md#version-53-0)
  - [Version 53.0b2](changelog.md#version-53-0b2)
  - [Version 53.0b1](changelog.md#version-53-0b1)
  - [Version 52.5](changelog.md#version-52-5)
  - [Version 52.4](changelog.md#version-52-4)
  - [Version 52.3](changelog.md#version-52-3)
  - [Version 52.2](changelog.md#version-52-2)
  - [Version 52.1](changelog.md#version-52-1)
  - [Version 52](changelog.md#version-52)
  - [Version 51](changelog.md#version-51)
  - [Version 50](changelog.md#version-50)
  - [Version 49](changelog.md#version-49)
  - [Version 48](changelog.md#version-48)
  - [Version 47](changelog.md#version-47)
  - [Version 46](changelog.md#version-46)
  - [Version 45](changelog.md#version-45)
  - [Version 44](changelog.md#version-44)
  - [Version 43](changelog.md#version-43)
  - [Version 43rc2](changelog.md#version-43rc2)
  - [Version 43rc1](changelog.md#version-43rc1)
  - [Version 0.42.3](changelog.md#version-0-42-3)
  - [Version 0.42.2](changelog.md#version-0-42-2)
  - [Version 0.42.1](changelog.md#version-0-42-1)
  - [Version 0.42](changelog.md#version-0-42)
  - [Version 0.41](changelog.md#version-0-41)
  - [Version 0.40](changelog.md#version-0-40)
  - [Version 0.39](changelog.md#version-0-39)
  - [Version 0.38](changelog.md#version-0-38)
  - [Version 0.37](changelog.md#version-0-37)
  - [Version 0.36](changelog.md#version-0-36)
  - [Version 0.35](changelog.md#version-0-35)
  - [Version 0.34](changelog.md#version-0-34)
  - [Version 0.33](changelog.md#version-0-33)
  - [Version 0.32](changelog.md#version-0-32)
  - [Version 0.31](changelog.md#version-0-31)
  - [Version 0.30](changelog.md#version-0-30)
  - [Version 0.29](changelog.md#version-0-29)
  - [Version 0.28](changelog.md#version-0-28)
  - [Version 0.27](changelog.md#version-0-27)
  - [Version 0.26](changelog.md#version-0-26)
  - [Version 0.25](changelog.md#version-0-25)
  - [Version 0.24](changelog.md#version-0-24)
  - [Version 0.23](changelog.md#version-0-23)
  - [Version 0.22](changelog.md#version-0-22)
  - [Version 0.21](changelog.md#version-0-21)
  - [Version 0.20.2](changelog.md#version-0-20-2)
  - [Version 0.20.1](changelog.md#version-0-20-1)
  - [Version 0.20](changelog.md#version-0-20)
  - [Version 0.19.2](changelog.md#version-0-19-2)
  - [Version 0.19.1](changelog.md#version-0-19-1)
  - [Version 0.19](changelog.md#version-0-19)
  - [Version 0.18](changelog.md#version-0-18)
  - [Version 0.17.1](changelog.md#version-0-17-1)
  - [Version 0.17](changelog.md#version-0-17)
  - [Version 0.16](changelog.md#version-0-16)
  - [Version 0.15](changelog.md#version-0-15)
  - [Version 0.14](changelog.md#version-0-14)
  - [Version 0.13](changelog.md#version-0-13)
  - [Version 0.12](changelog.md#version-0-12)
  - [Version 0.11](changelog.md#version-0-11)
  - [Version 0.10](changelog.md#version-0-10)
  - [Version 0.9](changelog.md#version-0-9)
  - [Version 0.8](changelog.md#version-0-8)
  - [Version 0.7.1](changelog.md#version-0-7-1)
  - [Version 0.7](changelog.md#version-0-7)
  - [Version 0.6.1](changelog.md#version-0-6-1)
  - [Version 0.6](changelog.md#version-0-6)
  - [Version 0.5](changelog.md#version-0-5)
  - [Version 0.4](changelog.md#version-0-4)
  - [Version 0.3.1](changelog.md#version-0-3-1)
  - [Version 0.3](changelog.md#version-0-3)
  - [Version 0.2](changelog.md#version-0-2)
  - [Version 0.1](changelog.md#version-0-1)
- [Contribute](contribute.md)
  - [Code & Issues](contribute.md#code-issues)
  - [Tests](contribute.md#tests)
  - [Documentation](contribute.md#documentation)
- [Support](support.md)
  - [Sponsorship](support.md#sponsorship)
  - [Professional Support](support.md#professional-support)
