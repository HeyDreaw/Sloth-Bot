#!/usr/bin/env ruby

require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "6OAd4ySh4GAlghx8UdIRbQ1or"
  config.consumer_secret     = "NTAJkYF2cueWVXrb78pXjEuX9C9Ib4LiNwvXjK2u06oXG4NODO"
  config.access_token        = "704463273484156928-NsTsIqOpMpinZbXvhANTNmDQ0w7wZls"
  config.access_token_secret = "wg5qKMyiaZ1J0dLxCkAWI0vkFbHpblZt0D7R8l6FFQxU6"
end

client.search("bad day").take(5).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
	client.update_with_media("@#{tweet.user.screen_name} Here's a picture of a sloth. I hope you have a better day!", File.new("cutesloth.jpg"),
		in_reply_to_status_id: tweet.id)
end
