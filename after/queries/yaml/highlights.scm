; extends

;; Highlight block mapping keys (property names) as properties
(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @property)))

;; Also handle flow mapping keys
(flow_mapping
  (flow_pair
    key: (flow_node
      [(plain_scalar) (double_quote_scalar) (single_quote_scalar)] @property)))

;; Significantly lower priority of string highlights so injected Liquid syntax always wins
;; Set to 50 (well below default 100 and our Liquid priority of 120)
((double_quote_scalar) @string.yaml
  (#set! "priority" 50))

((single_quote_scalar) @string.yaml
  (#set! "priority" 50))

