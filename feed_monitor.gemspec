# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feed_monitor/version'

Gem::Specification.new do |spec|
  spec.name          = "feed_monitor"
  spec.version       = FeedMonitor::VERSION
  spec.authors       = ["Brian Jones"]
  spec.email         = ["joshaidan@gmail.com"]
  spec.summary       = %q{Send email alerts for RSS feed updates}
  spec.description   = %q{Monitor RSS feeds for updates and send out email alerts for each updated item.}
  spec.homepage      = "http://joshaidan.github.io/feed_monitor"
  spec.license       = "GPL-2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0.1"
  
  spec.add_runtime_dependency 'dm-core', '~> 1.2', '>= 1.2.0'
  spec.add_runtime_dependency 'dm-migrations', '~> 1.2', '>= 1.2.0'
  spec.add_runtime_dependency 'dm-sqlite-adapter', '~> 1.2', '>= 1.2.0'
  spec.add_runtime_dependency 'pony', '~> 1.13', '>= 1.13.1'
  spec.add_runtime_dependency 'feedjira', '~> 3.1', '>= 3.1.1'
  spec.add_runtime_dependency 'httparty', '~> 0.18', '>= 0.18.0'
  
end
