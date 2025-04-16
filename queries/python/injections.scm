; extends

; only inject GraphQL into triple‑quoted python strings
(
  (string
    (string_content) @injection.content
  )
  ;; predicate: must start (after any whitespace/newlines) with "graphql" or "gql"
  (#match? @injection.content "^[[:space:]\r\n]*(query)")
  ;; action: hand off that capture to the graphql parser
  (#set! injection.language "graphql")
)
