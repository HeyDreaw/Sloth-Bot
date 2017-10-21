#!/usr/bin/env ruby

require 'twitter'

def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["consumer_key"]
      config.consumer_secret = ENV["consumer_secret"]
      config.access_token = ENV["access_token"]
      config.access_token_secret = ENV["access_token_secret"]
		end
end

client.search("#badday").take(10).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
  client.favorite(tweet)
	client.update_with_media("@#{tweet.user.screen_name} Here's a picture of a sloth. I hope you have a better day!", File.new("cutesloth.jpg"),
		in_reply_to_status_id: tweet.id)
end