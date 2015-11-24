#
# Class OsxStringsFileParser
# Description: This class allow to parse .strings file to JSON
#
# Original author: Cyril David (cyx)
# Original repository: https://github.com/cyx/osx_strings_file_parser
#
# Updated by: William Mura (william57m)
# Repository: https://github.com/william57m/osx_strings_file_parser
#

class Const

  class << self;
    attr_accessor :REGEX_COMMENT_MULTI
    attr_accessor :REGEX_COMMENT_SINGLE
    attr_accessor :REGEX_LINES
    attr_accessor :REGEX_QUOTED
    attr_accessor :REGEX_KEY_VALUE
  end

  self.REGEX_COMMENT_MULTI     = /\/\*(.*?)\*\//
  self.REGEX_COMMENT_SINGLE    = /\/\/[^\n]*/
  self.REGEX_LINES             = /\r\n|\r|\n|\u0085|\u2028|\u2029/
  self.REGEX_QUOTED            = /\"((\\\"|[^\"])+)\"/
  self.REGEX_KEY_VALUE         = /#{Const.REGEX_QUOTED}\s*=\s*#{Const.REGEX_QUOTED}/
end

class OsxStringsFileParser

  class KeyValuePair

    attr_accessor :key
    attr_accessor :value
    attr_accessor :comments

    def initialize(key, value)
        @key = key
        @value = value
    end

  end

  def initialize(data)
    @data = data
    @lines ||= @data.split(Const.REGEX_LINES)
    @idx = -1
    @line = nil
    @pairs = []

    while next_line
      if pair = @line.match(Const.REGEX_KEY_VALUE)
        @pairs << KeyValuePair.new(pair[1], pair[3])
      end
    end
  end

  def next_line
    @line = @lines[@idx += 1]
  end

  def lines
    @pairs
  end

  def to_hash
    @hash = Hash.new
    for key_value in lines
        @hash[key_value.key] = key_value.value
    end
    return @hash
  end

  def self.parse(data)
    new(data).to_hash
  end
end
