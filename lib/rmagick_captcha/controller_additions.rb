#
module RmagickCaptcha
  module ControllerAdditions
    # ::Rails.logger.error("...")

    module ClassMethods
      def download_rmagick_catcha(*symbols)
       symbols.each do |sym|
         define_method("#{sym}") do
           key = session[params[:id]]
           # Get current captcha key and send back
           image = key.nil? ? "" : ::RmagickCaptcha::RmagickBackend.get_captcha_image(key)
           send_data(image, :filename => "captcha.png", :type => "image/png", :disposition => 'inline')
         end
        end
      end
    end

  end
end