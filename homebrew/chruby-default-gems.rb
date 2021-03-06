require 'formula'

class ChrubyDefaultGems < Formula
  homepage 'https://github.com/tubbo/chruby-default-gems#readme'
  url 'https://github.com/tubbo/chruby-default-gems/archive/v1.0.1.tar.gz'
  sha1 '5e3044119248f3150d5faf3bbbf7bf48adfb2177'

  head 'https://github.com/tubbo/chruby-default-gems.git'

  def install
    %w(ruby jruby rubinius).each do |rb|
      system "mkdir -p ~/.post-install.d/#{rb}"
      system "touch ~/.post-install.d/#{rb}/default-gems"
    end
    system 'mkdir -p ~/.post-install.d/ruby ~/.post-install.d/jruby ~/.post-install.d/rubinius'
  end

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
