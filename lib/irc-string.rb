require 'irc-string/version'
require 'irc-string/parser'

module IrcString
  def self.parse(text)
    Parser.new text
  end
end
