# -*- coding: utf-8 -*-

class IrcString
  COLOR_CODE = "\x03" # \u0003
  BOLD       = "\x02" # \u0002
  UNDERLINE  = "\x1f" # \u001F
  INVERSE    = "\x16" # \u0016
  CLEAR      = "\x0f" # \u000F

  def initialize(str)
    @raw = str
    parse
  end

  def to_plain
    @parsed_strs.map {|s| s[:str]}.join
  end

  def to_html(class_prefix = '')
    @parsed_strs.map do |s|
      if s[:style].size == 0
        s[:str]
      else
        cls = []
        s[:style].each do |k,v|
          if v.is_a? TrueClass
            cls << "#{class_prefix}#{k}"
          elsif v.is_a? FalseClass
          else
            cls << "#{class_prefix}#{k}_#{v}"
          end
        end
        "<span class=\"#{cls.join(' ')}\">#{s[:str]}</span>"
      end
    end.join
  end

  private
  def parse
    @parsed_strs = []
    style = {}
    @raw.split(/(#{BOLD}|#{UNDERLINE}|#{INVERSE}|#{CLEAR})/).each do |str|
      loop do
        case str
        when /^#{COLOR_CODE}(\d\d?)(,(\d\d?))?(.*?)(#{COLOR_CODE})?$/
          style[:color]    = $1.to_i if $1
          style[:bg_color] = $3.to_i if $3
          str = $4
        when /^#{BOLD}(.*)$/
          style[:bold] = true
          str = $1
        when /^#{UNDERLINE}(.*)$/
          style[:underline] = true
          str = $1
        when /^#{INVERSE}(.*)$/
          style[:inverse] = true
          str = $1
        when CLEAR
          str = ''
        else
          break
        end
      end
      unless str == ''
        @parsed_strs << {:str => str, :style => style}
        style = {}
      end
    end
  end
end

