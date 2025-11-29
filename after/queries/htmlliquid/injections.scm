; Inherit HTML queries and add custom injections for .11ty.html files
; extends

;; Inject YAML into frontmatter (text between --- at start of file)
((text) @injection.content
  (#lua-match? @injection.content "^%-%-%-")
  (#set! injection.language "yaml")
  (#set! injection.combined))

;; Inject Liquid into text nodes containing {% %} or {{ }}
((text) @injection.content
  (#lua-match? @injection.content "{[%%{]")
  (#set! injection.language "liquid")
  (#set! injection.combined))

;; Inject Liquid into attribute values containing {% %} or {{ }}
((attribute_value) @injection.content
  (#lua-match? @injection.content "{[%%{]")
  (#set! injection.language "liquid")
  (#set! injection.combined))

