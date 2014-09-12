# FeedMonitor

FeedMonitor lets you monitor RSS feeds for updates, and send out an email with the update.

## Installation

Add this line to your application's Gemfile:

    gem 'feed_monitor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install feed_monitor

## Usage

Using feed_monitor is simple, add the following to your script:

	require 'feed_monitor'
	FeedMonitor.watch_feed('http://url_to_your_rss_feed/feed.xml', 'from_email@yourserver.com', 'to_email@emailaddress.com')

## Contributing

1. Fork it ( https://github.com/joshaidan/feed_monitor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
