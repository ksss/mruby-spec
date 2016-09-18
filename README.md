mruby-spec
===

This project is that mruby run [ruby/spec](https://github.com/ruby/spec)

# Start

```
$ git clone https://github.com/ksss/mruby-spec.git
$ cd mruby-spec
$ make TESTS="core/nil"
```

## TESTS

TESTS variable is target name for ruby/spec repo.
You can choose any file or dir.

# Examples

## Select a file

```
make TESTS="core/string/clone_spec.rb"
```

## Select a dir

```
make TESTS="core/string"
```

# Help

I hope mruby have compatibility with CRuby to some extent.
To be everything the same behavior will be impossible.
But now, mruby has many different behavior compared to CRuby.
We are waiting for your help.
