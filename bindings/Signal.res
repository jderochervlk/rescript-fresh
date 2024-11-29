type t<'a> = {mutable value: 'a}

@module("@preact/signals")
external useSignal: 'a => t<'a> = "useSignal"
