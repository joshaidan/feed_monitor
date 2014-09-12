require "feed_monitor/version"
require 'feedjira'
require 'pony'
require 'dm-core'
require 'dm-migrations'

module FeedMonitor
  DataMapper.setup(:default, 'sqlite:feedmonitor.db')

  class Site
    include DataMapper::Resource
    property :id, Serial
    property :url, String
    property :last_article_date, DateTime
  end

  DataMapper.auto_upgrade!
  DataMapper.finalize
  
  
  def self.watch_feed(url, from_email, to_email)
    # Fetch the feed
    feed = Feedjira::Feed.fetch_and_parse(url)
    
    # Make sure it's the correct type of feed
    return if !feed.is_a?(Feedjira::Parser::Atom) and !feed.is_a?(Feedjira::Parser::RSS)
    
    # Iterate through each feed entry
    feed.entries.reverse.each do |entry|
      site = Site.first_or_create(url: feed.feed_url)
      if (!site.last_article_date or (site.last_article_date < entry.published) )

        if entry.summary and entry.summary.size > 0
          body_message = entry.summary
        else
          body_message = entry.content
        end

        message = "<h1>#{entry.title}</h1><p>#{entry.published}</p>\n\n#{body_message}<p><a href=\"#{entry.url}\">Read more...</a></p>"

        Pony.mail :to => to_email,
          :from => from_email,
          :subject => "[RSS Alert] #{entry.title}",
          :html_body => message

        site.last_article_date = entry.published
        site.save
      end
    end
  end
  
end
