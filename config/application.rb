require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load
module Flashcards
  class Application < Rails::Application
    config.i18n.available_locales = %w(en ru)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.paperclip_defaults = {
        :storage => :s3,
        # :s3_host_name => 'https://console.aws.amazon.com/s3/home?region=us-east-1#&bucket=flashcardimages&prefix=',
        :s3_host_name => 'https://console.aws.amazon.com/s3/home?region=us-east-1#&bucket=flashcardimages&prefix=',
        :s3_credentials => {
            :bucket => "flashcardimages",
            :access_key_id => "AKIAJC27VPBZGOXDQIQQ",
            :secret_access_key => "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",
            :s3_region => "us-east-1"
    }
    }
  end
end
