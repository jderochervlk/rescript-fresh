open WebAPI

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

module URL = {
  type t = {
    href: string,
    origin: string,
    protocol: string,
    username: string,
    password: string,
    host: string,
    hostname: string,
    port: string,
    pathname: string,
    hash: string,
    search: string,
  }
}

module Router = {
  type destinationKind =
    | @as("internal") Internal
    | @as("static") Static
    | @as("route") Route
    | @as("notFound") NotFound
}

module ResolvedConfig = {
  type t // todo
}

module Context = {
  type renderOptions = FetchAPI.responseInit
  type t<'state, 'data, 'notFoundData> = {
    url: URL.t,
    basePath: string,
    route: string,
    destination: Router.destinationKind,
    params: Dict.t<string>,
    isPartial: bool,
    state: Dict.t<'state>,
    data: 'data,
    error?: unknown,
    codeFrame?: unknown,
    renderNotFound: option<'notFoundData> => promise<FetchAPI.response>,
    render: (option<'data>, option<renderOptions>) => promise<FetchAPI.response>,
    @as("Component") component: Preact.component<unknown>,
    next: unit => promise<FetchAPI.response>,
  }
}

module Handler = {
  type t<'state, 'data, 'notFoundData> = {
    @as("GET")
    get?: (FetchAPI.request, Context.t<'state, 'data, 'notFoundData>) => FetchAPI.response,
    @as("HEAD")
    head?: (FetchAPI.request, Context.t<'state, 'data, 'notFoundData>) => FetchAPI.response,
    @as("POST")
    post?: (FetchAPI.request, Context.t<'state, 'data, 'notFoundData>) => FetchAPI.response,
    @as("PUT")
    put?: (FetchAPI.request, Context.t<'state, 'data, 'notFoundData>) => FetchAPI.response,
    @as("DELETE")
    delete?: (FetchAPI.request, Context.t<'state, 'data, 'notFoundData>) => FetchAPI.response,
    @as("OPTIONS")
    options?: (FetchAPI.request, Context.t<'state, 'data, 'notFoundData>) => FetchAPI.response,
    @as("PATCH")
    patch?: (FetchAPI.request, Context.t<'state, 'data, 'notFoundData>) => FetchAPI.response,
  }
}
