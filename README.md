# IrcString

mIRC decoration string parser.

## Installation

Add this line to your application's Gemfile:

    gem 'irc-string'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install irc-string

## Usage

```ruby
require 'irc-string'

str = IrcString.parse("\u001F\u000304hello\u000F \u0002\u000308,03world\u000F")

str.to_html # => "<span class=\"underline color_4\">hello</span> <span class=\"bold color_8 bg_color_3\">world</span>"

str.to_html('irc_') # => "<span class=\"irc_underline irc_color_4\">hello</span> <span class=\"irc_bold irc_color_8 irc_bg_color_3\">world</span>"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
