;; Inject GraphQL when the string content starts with "graphql" or "gql"
; ((string_content) @graphql
;   (#set! injection.language "graphql")
;   ;; This pattern allows any whitespace or newlines before "graphql" or "gql"
;   (#match? @graphql "^[[:space:]]*(graphql|gql)")
; )
((string_content) @graphql
  (#set! injection.language "graphql")
)
