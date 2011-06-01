module RmagickCaptcha
  module Generators
    class RmagickCaptchaGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_rmagick_captcha
        copy_file "rmagick_captcha_controller.rb", "app/controllers/rmagick_captcha_controller.rb"
        copy_file "en_rmagick_captcha.yml", "config/locales/en_rmagick_captcha.yml"
        copy_file "ru_rmagick_captcha.yml", "config/locales/ru_rmagick_captcha.yml"
      end
    end
  end
end
