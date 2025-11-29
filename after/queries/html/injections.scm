; extends

;; These injections only activate when the patterns are present in the file
;; So regular HTML files without YAML/Liquid syntax won't be affected

;; Inject YAML into frontmatter (text starting with ---)
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

