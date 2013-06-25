#!/usr/bin/env ruby
require 'rubygems'
require 'em-rocketio-linda-client'
$stdout.sync = true

url   = ENV["LINDA_BASE"]  || ARGV.shift || "http://localhost:5000"
space = ENV["LINDA_SPACE"] || "takumibaba"
space_tweet = ENV["LINDA_SPACE_TWEET"] || "test"
puts "connecting.. #{url}"

EM::run do
  linda = EM::RocketIO::Linda::Client.new url
  ts = linda.tuplespace[space]
  ts_tweet = linda.tuplespace[space_tweet]

  linda.io.on :connect do  ## RocketIO's "connect" event
    puts "RocketIO connect!! (#{linda.io.type})"
    ts.watch ["babascript","eval"] do |tuple|
      p tuple
      next if tuple.size < 3
      tuple.shift
      tuple.shift
      code = tuple.shift.to_s
      args = tuple.shift
      if args.kind_of? Array
        args = args.map{|i| %Q{"#{i}"} }.join(', ')
      end
      puts code += "(#{args})"
      tuple = ["twitter", "tweet", "baba eval #{code}"]
      p tuple
      ts_tweet.write tuple
    end
  end

  linda.io.on :disconnect do
    puts "RocketIO disconnected.."
  end

end
