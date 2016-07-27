# AttrLazyReader

Making eazily initialized read-only attributes in a simple manner.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attr_lazy_reader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install attr_lazy_reader

## Usage

It contains only one method.

### `Module#attr_lazy_reader(sym, &block)` (private)
It makes `sym` method just like `Module#attr_reader`, but it requires block.

1. if instance variable `@#{sym}` exists (even if it is `nil`), just return it and block is not called.
2. Otherwise, `block` is evaluated in instance context, set the return value to instance variable `@#{sym}`,
and returns the value

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maisumakun/attr_lazy_reader.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

