module ThumbsYupRails
  module ServerEmbed
    class << self
      require 'net/http'
      require 'json'
      require_relative 'template_renderer'

      def render_public_reviews(page: nil)
        check_user_identifer!

        reviews_html = ""

        review_data = json_review_data(page: page)
        reviews = review_data["reviews"]
        metadata = review_data["metadata"]

        reviews.each do |review|
          reviews_html += decorate(review)
        end

        html = TemplateRenderer::render_page(
          settings: settings,
          pagination: pagination(metadata),
          reviews_html: reviews_html
        )

        html.html_safe
      end

      private

      def check_user_identifer!
        if ThumbsYupRails.configuration.user_identifier.nil?
          raise <<-EOS
            Create your user_identifier in: config/initializers/thumbs_yup_rails_init.rb
            ThumbsYupRails.configure do |config|
              config.user_identifier = "your-website-identifier"
            end
          EOS
        end
      end

      def json_review_data(page:)
        url = ThumbsYupRails.configuration.thumbs_yup_url + '/site/' + ThumbsYupRails.configuration.user_identifier

        uri = URI.parse(url)
        params = { :page => page }
        uri.query = URI.encode_www_form(params)

        request = Net::HTTP::Get.new(uri.request_uri)
        request["User-Agent"] = "My User Agent"
        request["Accept"] = "application/json"

        http = Net::HTTP.new(uri.host, uri.port)
        response = http.request(request)
        JSON.parse(response.body)
      end

      def decorate(json_review)
        TemplateRenderer::render_review(json_review)
      end

      def settings
        {
          review_style: ThumbsYupRails.configuration.review_style,
          review_color: ThumbsYupRails.configuration.review_color,
          review_background: ThumbsYupRails.configuration.review_background,
          review_size: ThumbsYupRails.configuration.review_size,
          thumbs_yup_url: ThumbsYupRails.configuration.thumbs_yup_url
        }
      end

      def pagination(metadata)
        {
          current_page: metadata["current_page"],
          total_count: metadata["total_count"],
          per_page: metadata["per_page"]
        }
      end
    end
  end
end
