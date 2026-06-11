# Description

Source: https://doc.courtbouillon.org/weasyprint/stable/manpage.html

# Description

weasyprint.\_\_main\_\_.main(*argv=sys.argv*)
:   The `weasyprint` program takes at least two arguments:

    > ```
    > weasyprint [options] <input> <output>
    > ```

    input
    :   URL or filename of the HTML input, or - for stdin.

    output
    :   Filename where output is written, or - for stdout.

    -i, --info
    :   Print system information and exit.

    --version
    :   Print WeasyPrint’s version number and exit.

    ## Rendering options

    -s <stylesheet>, --stylesheet <stylesheet>
    :   URL or filename for a user CSS stylesheet.

        This option can be passed multiple times.

    -a <attachment>, --attachment <attachment>
    :   URL or filename of a file to attach to the PDF document.

        This option can be passed multiple times.

    --attachment-relationship <attachment-relationship>
    :   Relationship of the attachment file to attach to the PDF.

        This option can be passed multiple times.

    --pdf-identifier <pdf-identifier>
    :   PDF file identifier.

    --pdf-variant <pdf-variant>
    :   PDF variant to generate.

        Possible choices: pdf/a-1b, pdf/a-2b, pdf/a-3b, pdf/a-2u, pdf/a-3u, pdf/a-4u, pdf/a-1a, pdf/a-2a, pdf/a-3a, pdf/a-4e, pdf/a-4f, pdf/ua-1, pdf/ua-2, pdf/x-1a, pdf/x-3, pdf/x-4, pdf/x-5g, debug.

    --pdf-version <pdf-version>
    :   PDF version number.

    --pdf-forms
    :   Include PDF forms.

    --pdf-tags
    :   Tag PDF for accessibility.

    --uncompressed-pdf
    :   Do not compress PDF content, mainly for debugging purpose.

    --xmp-metadata <xmp-metadata>
    :   URL or filename of a file to include into the XMP metadata.

        This option can be passed multiple times.

    --custom-metadata
    :   Include custom HTML meta tags in PDF metadata.

    --output-intent <output-intent>
    :   Srgb, device-cmyk, or CSS identifier of the output intent color space.

    -p, --presentational-hints
    :   Follow HTML presentational hints.

    --optimize-images
    :   Optimize size of embedded images with no quality loss.

    -j <jpeg-quality>, --jpeg-quality <jpeg-quality>
    :   JPEG quality between 0 (worst) to 95 (best).

    -D <dpi>, --dpi <dpi>
    :   Set maximum resolution of images embedded in the PDF.

    --full-fonts
    :   Embed unmodified font files when possible.

    --hinting
    :   Keep hinting information in embedded fonts.

    -c <cache-folder>, --cache-folder <cache-folder>
    :   Store cache on disk instead of memory, folder is created if needed and cleaned after the PDF is generated.

    ## HTML options

    -e <encoding>, --encoding <encoding>
    :   Force the input character encoding.

    -m <media-type>, --media-type <media-type>
    :   Media type to use for @media, defaults to print.

    -u <base-url>, --base-url <base-url>
    :   Base for relative URLs in the HTML input, defaults to the input’s own filename or URL or the current directory for stdin.

    ## URL fetcher options

    -t <timeout>, --timeout <timeout>
    :   Set timeout in seconds for HTTP requests.

    --allowed-protocols <allowed-protocols>
    :   Only authorize comma-separated list of protocols for fetching URLs.

    --no-http-redirects
    :   Do not follow HTTP redirects.

    --fail-on-http-errors
    :   Abort document rendering on any HTTP error.

# About

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
