# env-args

Add to your `stack.yaml`:

```yaml
- github: chrisdone/env-args
  commit: bfcad7b70c217218fd512bf8dbd90bead51e9385
```

And in your `app/main.hs`:

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
