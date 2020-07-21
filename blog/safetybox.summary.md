# Simple encryption in Elixir
#meta sort 2015-10-24
#meta tags[] elixir
### October 24, 2015

Of course you don't know anyone that actually stores user passwords in plaintext, or database passwords directly in a repository, so this is more for those theoretical developers to provide them with just a little bit more security; without adding much more complexity.

```elixir
# Encrypt a password and store it in pwd
iex> pwd = Safetybox.encrypt("helloworld")
"fc5e038d38a57032085441e7fe7010b0"

# Later on, you can validate the user provided password
# against the encrypted stored password
# Oopses, not the same
iex> Safetybox.is_decrypted("goodbyeworld", pwd)
false

# Ok, validated!
iex> Safetybox.is_decrypted("helloworld", pwd)
true
```