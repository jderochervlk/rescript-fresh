// Preact.res
/* Below is a number of aliases to the common `Jsx` module */
type element = Jsx.element

type component<'props> = Jsx.component<'props>

type componentLike<'props, 'return> = Jsx.componentLike<'props, 'return>

@module("preact")
external jsx: (component<'props>, 'props) => element = "h"

@module("preact")
external jsxKeyed: (component<'props>, 'props, ~key: string=?, @ignore unit) => element = "h"

@module("preact")
external jsxs: (component<'props>, 'props) => element = "h"

@module("preact")
external jsxsKeyed: (component<'props>, 'props, ~key: string=?, @ignore unit) => element = "h"

/* These identity functions and static values below are optional, but lets 
you move things easily to the `element` type. The only required thing to 
define though is `array`, which the JSX transform will output. */
external array: array<element> => element = "%identity"
@val external null: element = "null"

external float: float => element = "%identity"
external int: int => element = "%identity"
external string: string => element = "%identity"

/* These are needed for Fragment (<> </>) support */
type fragmentProps = {children?: element}

@module("preact") external jsxFragment: component<fragmentProps> = "Fragment"

/* The Elements module is the equivalent to the ReactDOM module in React. This holds things relevant to _lowercase_ JSX elements. */
module Elements = {
  /* Here you can control what props lowercase JSX elements should have. 
  A base that the React JSX transform uses is provided via JsxDOM.domProps, 
  but you can make this anything. The editor tooling will support 
  autocompletion etc for your specific type. */
  type props = {
    ...JsxDOM.domProps,
    class?: string,
    charset?: string,
    @as("f-client-nav") fClientNav?: bool,
  }

  @module("preact")
  external jsx: (string, props) => Jsx.element = "h"

  @module("preact")
  external div: (string, props) => Jsx.element = "h"

  @module("preact")
  external jsxKeyed: (string, props, ~key: string=?, @ignore unit) => Jsx.element = "h"

  @module("preact")
  external jsxs: (string, props) => Jsx.element = "h"

  @module("preact")
  external jsxsKeyed: (string, props, ~key: string=?, @ignore unit) => Jsx.element = "h"

  external someElement: element => option<element> = "%identity"
}

module Context = {
  type t<'context>

  type props<'context> = {
    value: 'context,
    children: element,
  }

  @get
  external provider: t<'context> => component<props<'context>> = "Provider"
}

@module("preact")
external createContext: 'a => Context.t<'a> = "createContext"

@module("preact/hooks")
external useState: (@uncurry (unit => 'state)) => ('state, ('state => 'state) => unit) = "useState"

@module("preact/hooks")
external useReducer: (@uncurry ('state, 'action) => 'state, 'state) => ('state, 'action => unit) =
  "useReducer"

@module("preact/hooks")
external useMemo: (@uncurry (unit => 'any), 'deps) => 'any = "useMemo"

@module("preact/hooks")
external useCallback: ('f, 'deps) => 'f = "useCallback"

@module("preact/hooks")
external useRef: 'value => ref<'value> = "useRef"

@module("preact/hooks")
external useContext: Context.t<'any> => 'any = "useContext"

@module("preact/hooks")
external useEffect: (@uncurry (unit => option<unit => unit>), 'deps) => unit = "useEffect"

@module("preact/hooks")
external useLayoutEffect: (@uncurry (unit => option<unit => unit>), 'deps) => unit =
  "useLayoutEffect"

@module("preact/hooks")
external useErrorBoundary: (Error.t => unit) => (Error.t, unit => unit) = "useErrorBoundary"

@module("preact/hooks")
external useId: unit => string = "useId"
