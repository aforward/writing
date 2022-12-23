# Clean bundler within a Ruby Script

```ruby
oenv = ENV.to_hash
begin
  %w{BUNDLE_GEMFILE RUBYOPT GEM_HOME GIT_DIR GIT_WORK_TREE BUNDLE_BIN_PATH}.each { |key| ENV.delete(key) }
  output = IO.popen("xlshell \"#{filename}\" \"#{worksheet}\"")
  return output.readlines.collect { |f| f.strip }
ensure
  ENV.replace(oenv)
end
```