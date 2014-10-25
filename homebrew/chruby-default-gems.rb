require 'formula'

class ChrubyDefaultGems < Formula
  homepage 'https://github.com/tubbo/chruby-default-gems#readme'
  url 'https://github.com/tubbo/chruby-default-gems/archive/master.zip'
  sha1 '9abfb6f906825229b7519f3a99fa749e6939f660'
  version '0.0.1'

  head 'https://github.com/tubbo/chruby-default-gems.git'

  def caveats
    %(
      Installation:

      Copy the following line into your .bash_profile or .zshenv:

        source #{prefix}/lib/chruby-default-gems/lib/chruby/default_gems.sh

      You can also set the DEFAULT_GEMFILE variable if you wish to store
      your default-gems in a location other than
      ~/.post-install.d/$RUBY/default-gems (where $RUBY is the kind of
      Ruby you're installing, like "jruby", "ruby" or "rubinius").
    )
  end
end
