; Extends default svelte highlighting with HTML tag support
; inherits: html_tags

; Original Svelte queries
(raw_text) @none

[
  "as"
  "key"
  "html"
  "snippet"
  "render"
] @keyword

"const" @keyword.modifier

[
  "if"
  "else if"
  "else"
  "then"
] @keyword.conditional

"each" @keyword.repeat

[
  "await"
  "then"
] @keyword.coroutine

"catch" @keyword.exception

"debug" @keyword.debug

[
  "{"
  "}"
] @punctuation.bracket

[
  "#"
  ":"
  "/"
  "@"
] @tag.delimiter

; HTML tag highlighting for Svelte templates
(element
  (start_tag
    (tag_name) @tag)
  (end_tag
    (tag_name) @tag)) @markup.tag

(element
  (start_tag
    (tag_name) @tag
    (attribute
      (attribute_name) @attribute)))

(svelte_element
  (svelte_tag_name) @tag)

(svelte_options
  (svelte_tag_name) @tag)

(svelte_head
  (svelte_tag_name) @tag)

; Self-closing tags
(self_closing_tag
  (tag_name) @tag) @markup.tag

; Attributes
(attribute
  (attribute_name) @attribute)

(quoted_attribute_value
  (attribute_value) @string)

; Text content
(text) @text

; Comments
(comment) @comment

