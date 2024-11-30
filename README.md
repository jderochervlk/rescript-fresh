# @jvlk/rescript-fresh
ReScript bindings and utils for [Fresh](https://fresh.deno.dev/).

## Getting started
You can clone this [example repo](https://github.com/jderochervlk/rescript-fresh-example) to get started. It's the same thing you get by creating a new Fresh app, just set up to use ReScript.

### Adding ReScript to an existing Fresh app
#### Create a ReScript config file
```
// rescript.json
{
    "name": "rescript-fresh-example",
    "sources": [
        {
            "dir": "components",
            "subdirs": true
        },
        {
            "dir": "islands",
            "subdirs": true
        },
        {
            "dir": "routes",
            "subdirs": true
        }
    ],
    "package-specs": [
        {
            "module": "esmodule",
            "in-source": true
        }
    ],
    "suffix": ".js", // the suffix needs to be .js for Fresh to pick up on route files
    "jsx": {
        "module": "preact" // Fresh uses Preact
    },
    "bs-dependencies": [
        "@rescript/webapi", // it's highly recommended to use the webapi with Fresh
        "@jvlk/rescript-fresh"
    ],
    "bsc-flags": [
        "-open WebAPI.Global"
    ]
}
```
### Update the Deno config
```diff
// deno.json
{
    "tasks": {
+       "res:dev": "rescript -w",
+       "res:build": "rescript",
+       "res:clean": "rescript clean"
    },
    "imports": {
+      "rescript": "npm:rescript@next",
+      "@rescript/webapi": "npm:@rescript/webapi@experimental",
+      "@jvlk/rescript-fresh": "npm:@jvlk/rescript-fresh@^0.2.0"
    }
}
```

### Running
In one terminal run `deno task res:dev` and in another run `deno task start`.