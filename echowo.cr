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
    OptionParser.parse do |parser|
      parser.banner = <<-HELP
        Usage: echowo [OPTIONS] [STRING]
        UNIX echo command which also uwu-fies text
        HELP
      parser.on "-v", "--version", "Show version" { puts VERSION; exit }
      parser.on "-h", "--help", "Show help" { puts parser; exit }
      parser.on "-n", "Do not append a newline" { self.newline = false }
    end

    # print only if some argument is given
    print "#{random_uwuism} #{ARGV.uwufication.join(' ')} #{random_uwuism}" if ARGV.size > 0
    print "\n" if self.newline?
    STDOUT.flush
  end

  class_property? newline = true
end

Echowo.main
