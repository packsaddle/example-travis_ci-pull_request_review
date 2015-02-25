# Example::TravisCi

run rubocop and pull request review comment

[Travis CI: Encryption keys](http://docs.travis-ci.com/user/encryption-keys/)

```
$ gem install travis
$ travis encrypt -r <repos_name> "GITHUB_ACCESS_TOKEN=<github_token>"
```

## Contributing

1. Fork it ( https://github.com/packsaddle/example-ruby-travis-ci/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
