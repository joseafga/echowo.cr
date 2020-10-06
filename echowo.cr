require "option_parser"
require "./echowo/string"

module Echowo
  extend self

  VERSION           = "0.1.0"
  ESCAPES_REFERENCE = "abeEfnrtv"
  ESCAPES_REPLACE   = "\a\b\033\033\f\n\r\t\v"
  UWUISM            = {
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
  }

  # generate random words from list
  def random_uwuism
    UWUISM[Random.rand(UWUISM.size)]
  end

  def unescape(text : String)
    # walkthough text chars
    chars = Char::Reader.new(text)
    while chars.has_next?
      c = chars.current_char
      chars.next_char

      if c == '\\' && chars.has_next?
        c = chars.current_char
        chars.next_char

        index = ESCAPES_REFERENCE.index(c)
        c = ESCAPES_REPLACE[index] unless index.nil?

        case c
        when 'c'; exit
        when 'x'
          value = chars.string[chars.pos, 2][/^[0-F]+/i]
          chars.pos += value.size

          c = value.to_u8(16).chr
        when '0'
          value = chars.string[chars.pos, 3][/^[0-7]+/i]
          chars.pos += value.size

          c = value.to_u8(8).chr
        when 'u' # 16 bits
          value = chars.string[chars.pos, 4][/^[0-F]+/i]
          chars.pos += value.size

          c = value.to_u16(16).chr
        when 'U' # 32 bits
          value = chars.string[chars.pos, 8][/^[0-F]+/i]
          chars.pos += value.size

          c = value.to_u32(16).chr
        end
      end

      print c
    end
  end

  def main
    OptionParser.parse do |parser|
      parser.banner = <<-HELP
        Usage: echowo [OPTIONS] [STRING]
        UNIX echo command which also uwu-fies text
        HELP
      parser.on "-v", "--version", "Show version" { puts VERSION; exit }
      parser.on "-n", "Do not append a newline" { self.newline = false }
      parser.on "-e", "Enable interpretation of backslash escapes" { self.escape = true }
      parser.on "-E", "Disable interpretation of backslash escapes" { self.escape = false }
      parser.on "-h", "--help", "Show help" { puts parser; exit }
      parser.on "-n", "Do not append a newline" { self.newline = false }
    end

    # Print only if some argument is given
    if ARGV.size > 0
      output = " #{ARGV.join(' ').uwufication} "

      print random_uwuism
      if self.escape?
        print unescape(output)
      else
        output
      end
      print random_uwuism
    end

    print '\n' if self.newline?
    STDOUT.flush
  end

  class_property? newline = true
  class_property? escape = false
end

Echowo.main
