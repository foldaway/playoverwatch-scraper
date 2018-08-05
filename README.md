# playoverwatch-scraper
[![Build Status](https://travis-ci.org/bottleneckco/playoverwatch-scraper.svg?branch=master)](https://travis-ci.org/bottleneckco/playoverwatch-scraper)
[![Gem Version](https://badge.fury.io/rb/playoverwatch-scraper.svg)](https://badge.fury.io/rb/playoverwatch-scraper)

Retrieve player statistics from their profiles on [the Overwatch website](playoverwatch.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'playoverwatch-scraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install playoverwatch-scraper

## Usage

[RubyDocs](https://www.rubydoc.info/github/bottleneckco/playoverwatch-scraper/master)

```ruby
scraper = PlayOverwatch::Scraper.new('Someone-1234')

# SR
puts scraper.sr

# Level
puts scraper.player_level
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/playoverwatch-scraper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Playoverwatch project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/playoverwatch-scraper/blob/master/CODE_OF_CONDUCT.md).
