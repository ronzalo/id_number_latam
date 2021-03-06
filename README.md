# IdNumberLatam

[![Ruby](https://github.com/ronzalo/id_number_latam/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/ronzalo/id_number_latam/actions/workflows/main.yml)

A gem to validate the format of the identification number in some of latam countries, currently only for Argentina, Chile, Ecuador, Paraguay, Perú and Uruguay, but it can be easily extended to other countries.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'id_number_latam'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install id_number_latam

## Usage

```ruby
# DNI for Chile
dni = IdNumberLatam::Base.new('11111111-1', country: :cl)
dni.valid?
#=> true
dni.format
#=> "11.111.111-1"
dni.unformat
#=> "111111111"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ronzalo/id_number_latam. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ronzalo/id_number_latam/blob/master/CODE_OF_CONDUCT.md).

## To-do

 - [ ] Add more countries
 - [ ] Add more tests
 - [ ] Add more validations
 - [ ] Add Rails class methods support

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the IdNumberLatam project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ronzalo/id_number_latam/blob/master/CODE_OF_CONDUCT.md).
