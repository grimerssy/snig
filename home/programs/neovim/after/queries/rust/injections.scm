; extends

; (macro_invocation
;   (scoped_identifier
;     path: (identifier) @_path (#eq? @_path "sqlx")
;     name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_unchecked")
;   )
;   (token_tree
;     (raw_string_literal) @sql
;   )
; )
;
; (call_expression
;   function: (scoped_identifier
;     path: (identifier) @_path (#eq? @_path "sqlx")
;     name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_unchecked")
;   )
;   arguments: (arguments
;      (raw_string_literal) @sql
;   )
; )
