require 'optparse'
require_relative '../lib/result'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: count-character-spoken.rb [options]"

  opts.on("-p", "--parameter=PARAMETER", "Parameter for order character or count") do |p|
    options[:parameter] = p
  end
  
  opts.on("-o", "--order=ORDER", "Order asc or desc") do |o|
    options[:order] = o
  end
end.parse!

puts options

CharacterSpokenLinesCount::Result.new(options).print