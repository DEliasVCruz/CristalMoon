; extends

;; Increase priority of Liquid highlights to override YAML string highlights
;; YAML strings have priority 50, so we use 120 to ensure Liquid wins

;; Liquid filter pipe operator - HIGHEST priority to always show
("|" @operator.liquid
  (#set! "priority" 130))

;; Liquid filter names (functions) - HIGHER priority than variables
((filter
  name: (identifier) @function.liquid)
  (#set! "priority" 130))

;; Liquid numbers in filter arguments
((number) @number.liquid
  (#set! "priority" 120))

;; Liquid property access (e.g., pagination.pageNumber)
((access
  property: (identifier) @property.liquid)
  (#set! "priority" 120))

;; Liquid variable receivers in access (e.g., 'pagination' in pagination.pageNumber)
((access
  receiver: (identifier) @variable.liquid)
  (#set! "priority" 120))

