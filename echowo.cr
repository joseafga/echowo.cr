require "option_parser"
require "./echowo/array"

module Echowo
  extend self

  VERSION = "0.1.0"
  UWUISM  = [
    "uwu",
    "owo",
    "^w^",
    "murr...",
    "nya!",
    "nyanyan!",
    "huoooh...",
    "nyu...",
    ":3",
    "rawr!",
    # "fuck!!!1!", OwO
  ]

  # generate random words from list
  def random_uwuism
    UWUISM[Random.rand(UWUISM.size)]
  end

  def main
    newline = true

    OptionParser.parse do |parser|
      parser.banner = <<-HELP
      Usage: echowo [OPTIONS] [STRING]
      UNIX echo command which also uwu-fies text
      HELP

      parser.on "-v", "--version", "Show version" do
        puts Echowo::VERSION
        exit
      end
      parser.on "-h", "--help", "Show help" do
        puts parser
        exit
      end
      parser.on "-n", "Do not append a newline" do
        newline = false
      end
    end

    print "#{random_uwuism} #{ARGV.uwufication.join(' ')} #{random_uwuism}"
    print "\n" if newline # print newline on end?
    STDOUT.flush
  end
end

ARGV << "-h" if ARGV.size == 0 # Display help if no parameters
Echowo.main
