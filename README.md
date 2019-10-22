# env-args

```haskell
import System.EnvArgs
```

Wrap `withEnvArgs "YOURPREFIX_"` around your arguments parser
(e.g. optparse-applicative), and now you can pass

* `YOURPREFIX_arg1` for `--arg1` (drops the prefix and adds `--`).
* `YOURPREFIX_arg_foo` for `--arg-foo` (replaces `_` with `-`)
* `YOURPREFIX_ARG_FOO` for `--arg-foo` (auto-lower-casing)

Which is useful when deploying programs where passing environment
variables is more convenient and more secure than passing arguments to
the process.
