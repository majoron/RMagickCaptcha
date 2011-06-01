#
module RmagickCaptcha
  module ControllerAdditions
    # ::Rails.logger.error("...")

    module ClassMethods
      def download_rmagick_catcha(*symbols)
       symbols.each do |sym|
         define_method("#{sym}") do
           # Get current captcha key and send back
           send_data(::RmagickCaptcha::RmagickBackend.get_captcha_image(session[params[:id]]),
            :filename => "captcha.png", :type => "image/png", :disposition => 'inline')
         end
        end
      end
    end

  end
end