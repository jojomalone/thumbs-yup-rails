# ThumbsYupRails

Tools for integrating with the thumbsyup.com web services.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thumbs-yup-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thumbs-yup-rails

## Usage

Place in `config/initializers/thumbs_yup_rails_init.rb`:

```
ThumbsYupRails.configure do |config|
  config.user_identifier = "your-thumbsyup-website-identifier"
end
```

Place in your template:
```
<%= ThumbsYupRails::ServerEmbed.render_public_reviews(page: params[:page]) %>
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

