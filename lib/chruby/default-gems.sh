# Override this ruby-install hook, but run default post-install
# hooks for this Ruby prior to our override.
post_install() {
  post_install && install_default_gems
}

# Install default gems a la rbenv!
install_default_gems() {
  eval DEFAULT_GEMFILE="${DEFAULT_GEMFILE-'$HOME/.default-$RUBY-gems'}"

  # Only install default gems after successfully installing Ruby.
  [ "$STATUS" = "0" ] || return 0

  if [ -f $DEFAULT_GEMFILE ]; then
    local line gem_name gem_version args

    # Read gem names and versions from $RBENV_ROOT/default-gems.
    while IFS=" " read -r -a line; do

      # Skip empty lines.
      [ "${#line[@]}" -gt 0 ] || continue

      # Skip comment lines that begin with `#`.
      [ "${line[0]:0:1}" != "#" ] || continue

      gem_name="${line[0]}"
      gem_version="${line[1]}"

      # Build command arguments
      if [ "$gem_version" == "--pre" ]; then
        args=( --pre )
      elif [ -n "$gem_version" ]; then
        args=( --version "$gem_version" )
      else
        args=()
      fi

      # Invoke `gem install` in the just-installed Ruby. Point its
      # stdin to /dev/null or else it'll read from our default-gems
      # file.
      chruby-exec $RUBY_VERSION -- gem install "$gem_name" "${args[@]}" < /dev/null || {
        echo "rbenv: error installing gem \`$gem_name'"
      } >&2

    done < $DEFAULT_GEMFILE
  fi
}
