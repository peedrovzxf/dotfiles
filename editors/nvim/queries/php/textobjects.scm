; extends

(method_declaration
  body: (_) @function.inner) @function.outer

(function_definition
  body: (_) @function.inner) @function.outer

(class_declaration
  body: (_) @class.inner) @class.outer
