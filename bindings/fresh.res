@module("$fresh/runtime.ts")
external is_browser: bool = "IS_BROWSER"

module Head = {
  @module("$fresh/runtime.ts") @jsx.component
  external make: (~children: Jsx.element) => Jsx.element = "Head"
}

module Partial = {
  @module("$fresh/runtime.ts") @jsx.component
  external make: (~children: Jsx.element, ~name: string) => Jsx.element = "Partial"
}
