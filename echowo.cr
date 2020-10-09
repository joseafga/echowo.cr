require "option_parser"
require "./echowo/string"

module Echowo
  extend self

  VERSION     = "0.2.0"
  ESCAPES_REF = "abeEfnrtv"
  ESCAPES_REP = "\a\b\033\033\f\n\r\t\v"
  UWUISM      = {
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

  # Generate random words from list
  def random_uwuism
    UWUISM[Random.rand(UWUISM.size)]
  end

  # Accept non UTF-8 char
  def non_utf8_char(codepoint : UInt8)
    String.new(Bytes[codepoint])
  end

  def unescape(text : String)
    # Walkthough text chars
    chars = Char::Reader.new(text)
    while chars.has_next?
      c = chars.current_char
      chars.next_char

      if c == '\\' && chars.has_next?
        c = chars.current_char
        chars.next_char

        index = ESCAPES_REF.index(c)
        unless index.nil?
          print ESCAPES_REP[index]
          next
        end

        case c
        when 'c'; exit
        when 'x'
          value = chars.string[chars.pos, 2][/^[0-F]+/i]
          chars.pos += value.size

          c = non_utf8_char value.to_u8(16)
        when '0'
          value = chars.string[chars.pos, 3][/^[0-7]+/i]
          chars.pos += value.size

          c = non_utf8_char value.to_u8(8)
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
        Usage: echowo [OPTIONS] [ARG ...]
        Write uwufied arguments to the standard output.
        HELP
      parser.on "-v", "--version", "show version" { puts VERSION; exit }
      parser.on "-n", "do not append a newline" { self.newline = false }
      parser.on "-e", "enable interpretation of backslash escapes" { self.escape = true }
      parser.on "-E", "disable interpretation of backslash escapes" { self.escape = false }
      parser.on "-h", "--help", "show help" { puts parser; exit }
      parser.on "-n", "do not append a newline" { self.newline = false }
    end

    # Print only if some argument is given
    if ARGV.size > 0
      output = " #{ARGV.join(' ').uwufication} "

      print random_uwuism
      if self.escape?
        unescape output
      else
        print output
      end
      print random_uwuism
    end

    print '\n' if self.newline?
  end

  class_property? newline = true
  class_property? escape = false
end

Echowo.main
