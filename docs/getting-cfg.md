# Getting CFG Files

## GraalVM Compiler as a Java compiler

`-Dgraal.Dump=:1` and `-Dgraal.PrintBackendCFG=true` is the simple option to
enable Graal CFG dumping.

You may want to combine with `-XX:CompileOnly=Foo::foo` (you can omit the class
part) to restrict  compilation to a single method to give fewer CFG files, and
to some extent make graphs simpler by avoiding what you want to look at being
inlined, or other things being inlined into it.

## TruffleRuby and other Truffle languages

Use the same options as for GraalVM for Java, except they're prefixed with
`--vm.`, for example `--vm.Dgraal.Dump=Truffle:1` and
`--vm.Dgraal.PrintBackendCFG=true`.

Use with `--engine.CompileOnly=foo`.

You may want to disable on-stack-replacement and inlining with
`--engine.Inlining=false` and `--engine.OSR=false` in order to make graphs
easier to understand.

You may need to use `--experimental-options`.
