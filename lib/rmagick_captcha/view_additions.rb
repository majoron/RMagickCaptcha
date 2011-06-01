#
module RmagickCaptcha
  module ViewAdditions
    # ::Rails.logger.error("...")

    #
    #
    def rmagick_captcha_tag(options = {})
      options = ::RmagickCaptcha.options.merge(options)
      image_tag("/#{options[:controller]}/#{options[:action]}?id=#{options[:id]}")
    end

  end
end