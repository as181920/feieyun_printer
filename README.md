# FeieyunPrinter

飞鹅云小票机对接gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'feieyun_printer', git: "git@github.com:as181920/feieyun_printer.git", branch: "master"
```

## Usage

```ruby
#snlist = "sn1#key1#remark1#carnum1\nsn2#key2#remark2#carnum2"
ApiClient.new(user, ukey).then do |ac|
  ac.add_printer(sn_list)
  ac.print(sn, content, {times: 1})
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/feieyun_printer.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
