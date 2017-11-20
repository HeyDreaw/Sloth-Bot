#!/usr/bin/env ruby

require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "6OAd4ySh4GAlghx8UdIRbQ1or"
  config.consumer_secret     = "NTAJkYF2cueWVXrb78pXjEuX9C9Ib4LiNwvXjK2u06oXG4NODO"
  config.access_token        = "704463273484156928-NsTsIqOpMpinZbXvhANTNmDQ0w7wZls"
  config.access_token_secret = "wg5qKMyiaZ1J0dLxCkAWI0vkFbHpblZt0D7R8l6FFQxU6"
end

client.search("sloths").take(10).each do |tweet|
	client.update("#{tweet.user.screen_name}: #{tweet.text}")
end