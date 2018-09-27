# PyRSS Generator

Aim: produce an RSS feed generator that will take

* url - base URL
* CSS Selector - pattern that provides content - becomes child in the output
    * default is `html body #content`
    * or `html body`
* Optional - type - single or multi - default single
* Optional - CSS Selector - to identify node to use to generate hash
    * if multi-entry, then applies to individual elements
    * default is `html head title`

And spit out

* an RSS feed
* with each element found as its CDATA child

## Proposal

Expect a URL of the form

    http://<site>/rss?url=<escaped url>&\
        content=<css selector>&\
        type=<"single"|"multi">&\
        hashnode=<css selector>

Agnostically generate the RSS feed for the requested page
