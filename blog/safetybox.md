# Simple encryption in Elixir
#meta datetime 2015-10-24
#meta tags[] elixir

## Summary

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

## Article

Of course you don't know anyone that actually stores user passwords in plaintext, or database passwords directly in a repository, so this is more for those theoretical developers to provide them with just a little bit more security; without adding much more complexity

Before you get started, you will need a working [Elixir](https://elixir-lang.org/) environment. Once that is ready, let's play with [safetybox](https://github.com/aforward/safetybox).

```shell
mix new myproj
cd myproj
vi mix.exs

  # Add safetybox to your dependencies
  defp deps do
    [
      {:safetybox, "~> 0.1.2" }
    ]
  end
```

Now you can compile your code and a start an IEX session.

```shell
mix deps.get
mix compile
iex -S mix
```

### Encrypting User Data (one-way)

For one way encryption, e.g. storying user passwords, simply encrypt the string.

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

### Encrypting Config Data (two-way)

You will also want to encrypt configuration passwords, like those for databases.  For this, you will need a secret and salt.

```elixir
iex> enc = Safetybox.encrypt("helloworld", "MYSECRET", "MYSALT")
"dWlwZnh5QmlwOFBmYm1US0hWeUtTWG9adGpPZ3pOald6TFE1V25ZVWl1WT0tLXpSU2lhQzFQWDR0blc5VVNqZGV1b3c9PQ==--7C53B199CE26A6B39081236823329A606DFF37DF"
iex> dec = Safetybox.decrypt(enc, "MYSECRET", "MYSALT")
"helloworld"
iex> dec = Safetybox.decrypt(enc, "YOURSECRET", "YOURSALT")
:error
```

You can also run a mix command to generate your secret keys.

```shell
$ SECRET=MYSECRET SALT=MYSALT mix safetybox.encrypt helloworld
N2MwMUczREVCYU5zNXFUR0NtVFNZSEJEaWNETCtTWjJkZzNkeVptbWdEST0tLUhxRHB2R1ZxVUpNcmswWFRqdW9oa3c9PQ==--EAD3CEE629EC527E7C67C9E5AE1385D630BDB24A
```

You can now (more) safely store these encrypted strings directly in your configurations files, and in use environment variables to store your SECRET and SALT.

```elixir
vi ./config/prod.exs
  config :myapp,
    secret: System.get_env("SECRET") || "myappsecret",
    salt: System.get_env("SALT") || "myappsalt",
    db_password: "Z3NLcGVwdjQ1UWtHL2lsUC9UN0xHQT09LS1lRFF0eUpJdmhObzZ6b2lZNzVQRlVBPT0=--68B020579898BCE71B01B7558DB9C0D3D9305350",
    db_user: "myapp"
```
And, then in your code you can decrypt the data using the Application.get_env function.

```elixir
def conf(_env) do
  raw_password = Application.get_env(:myapp, :db_password)
  password = S.decrypt(raw_password, :myapp)
  parse_url "ecto://myapp:# {password}@localhost/myapp"
end
```

The code above is really only as secure as your SECRET and SALT, but it is much, much better than storing passwords directly in your database (no matter how small your project may be). For those trying out [Elixir](https://elixir-lang.org/), [safetybox](https://github.com/aforward/safetybox) provides a simple enough mechanism to encrypt your own passwords, as well as the passwords of your users.

### Behind the scenes

I did not (nor should I) write the underlying algorithms for providing the encyrption.  I simply wrapped available functions from other libraries in a slightly more user friendly form at the cost of somewhat reduced security.

The code is [open sourced](https://github.com/aforward/safetybox), and one-way encryption uses MD5 hashing combined with low level Erlang functions, shown below

```elixir
def encrypt(plaintext) do
  :crypto.hash(:md5, plaintext)
    |> :erlang.bitstring_to_list
    |> Enum.map(&(:io_lib.format("~2.16.0b", [&1])))
    |> List.flatten
    |> :erlang.list_to_bitstring
end
```

The two-way encryption is a wrapper to [cryptex](https://github.com/scrogson/cryptex) which itself is a wrapper to [crypto](http://erlang.org/doc/man/crypto.html).  The cryptex example was too cumbersome for my needs, so I encapsulated the Encryptor and KeyGenerator so that the only additional inputs were a SECRET and a SALT.

```elixir
def encrypt(plaintext, secret, salt) when is_binary(secret) do
  secret
  |> K.generate(salt)
  |> E.new(K.generate(secret, "signed # {salt}"))
  |> E.encrypt_and_sign(plaintext)
end
```

The decryption function is simiarly wrapped.

If you disagree with me, then I invite you to fork the project and provide your own approach.

### Resources

- [Safetbox Source (Github)](https://github.com/aforward/safetybox)
- [HEX API Documentation](https://hexdocs.pm/safetybox/)
- [Elixir](https://elixir-lang.org/) (a rubyesque functional language on top of Erlang)
- [Phoenix](https://github.com/phoenixframework/phoenix) (web framework for Elixir)
- [Cryptex](https://github.com/scrogson/cryptex) (underlying crypto Elixir library)
- [Crypo](https://erlang.org/doc/man/crypto.html) (Erlang cryptography library)
