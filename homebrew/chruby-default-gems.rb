require 'formula'

class ChrubyDefaultGems < Formula
  homepage 'https://github.com/bronson/chruby-default-gems#readme'
  url 'https://github.com/bronson/chruby-default-gems/archive/master.zip'
  sha1 '9abfb6f906825229b7519f3a99fa749e6939f660'
  version '0.0.1' # delete this line once Homebrew can detect the version from t

  head 'https://github.com/bronson/chruby-default-gems.git'

  def install
    share.install "default-gems.sh"
    bin.install 'update-default-gems'
  end

  def caveats
    %(
      Installation:

      Copy the following line into your .bash_profile or .zshenv:

        source #{opt_share}/default-gems.sh

      You can also set the DEFAULT_GEMFILE variable if you wish to store
      your default-gems in a location other than ~/.default-$RUBY-gems
      (where $RUBY is the kind of Ruby you're installing: "jruby", "ruby", ...)
    )
  end

  # test do
  #   system "#{bin}/update-default-gems --version | grep #{version}"
  # end
end
