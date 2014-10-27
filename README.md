# chruby-default-gems

This [chruby][postmodern/chruby] plugin ensures the Rubies you
build (with [ruby-install][postmodern/ruby-install])
come with the gems you want.
It is forked from [rbenv-default-gems][sstephenson/rbenv-default-gems].

## Installation

If you're on OS X and use Homebrew, this is easiest
(make sure to follow directions):

    brew install https://raw.github.com/bronson/chruby-default-gems/master/homebrew/chruby-default-gems.rb --HEAD

Otherwise, run:

    git clone https://github.com/bronson/chruby-default-gems ~/.chruby-default-gems

And add the following to your shell configuration:

    source ~/.chruby-default-gems/chruby-default-gems.sh

## Usage

chruby-default-gems automatically installs the gems listed in the
`$DEFAULT_GEMFILE` file every time you install a new Ruby.
By default, this file is at `~/.default-$RUBY-gems` (where `$RUBY` is
replaced by `ruby`, `jruby`, `rubinius`)

You can change `$DEFAULT_GEMFILE` in your .bashrc.  Remember to surround
chruby variables (like `$RUBY`) with single quotes,
otherwise they will be expanded when your .bashrc is read
(before the `$RUBY` variable can be set).  If you're
getting errors along the lines of "Could not find ~/.default--gems",
this is probably what's happeneing.

```bash
# single quotes ensure $RUBY won't be expanded until install time
DEFAULT_GEMFILE='.defaults/$RUBY/Gemfile'
```

If DEFAULT_GEMFILE doesn't exist, chruby-default-gems exits without doing
anything.


## Updating Defaults

Whenever you change your defaults, you can run the `chruby-default-gems`
command to reinstall your default gems into the current Ruby.
It does not remove gems.


## Default Gemfile

Specify gems in `$DEFAULT_GEMFILE` by name, one per line. You may
optionally specify a version string after the name, or `--pre` to
install a prerelease version. For example:

```bash
bundler
bcat ~>0.6
rails --pre
```

Blank lines and lines beginning with a `#` are ignored.

## License

(The MIT License)

Copyright (c) 2013 [Sam Stephenson][sstephenson], [Tom Scott][tubbo], [Scott Bronson][bronson]

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[postmodern]: https://github.com/postmodern
[postmodern/chruby]: https://github.com/postmodern/chruby
[postmodern/ruby-install]: https://github.com/postmodern/ruby-install
[sstephenson]: https://github.com/sstephenson
[sstephenson/rbenv]: https://github.com/sstephenson/rbenv
[sstephenson/rbenv-default-gems]: https://github.com/sstephenson/rbenv-default-gems
[tubbo]: http://github.com/tubbo
[bronson]: http://github.com/bronson
