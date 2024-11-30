type t<'a> = {mutable value: 'a}

@module("@preact/signals")
external signal: 'a => t<'a> = "signal"

@module("@preact/signals")
external computed: unit => t<'a> = "computer"

@module("@preact/signals")
external effect: unit => unit = "effect"

@module("@preact/signals")
external batch: unit => unit = "batch"

@module("@preact/signals")
external useSignal: 'a => t<'a> = "useSignal"

@module("@preact/signals")
external useComputed: unit => t<'a> = "useComputed"

@module("@preact/signals")
external useSignalEffect: unit => unit = "useSignalEffect"
