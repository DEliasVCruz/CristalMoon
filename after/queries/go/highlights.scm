;; extends

(function_declaration
  name: (identifier) @function.declaration)

(method_declaration
 receiver: (parameter_list
  (parameter_declaration
   name: (identifier) @variable.struct)))
