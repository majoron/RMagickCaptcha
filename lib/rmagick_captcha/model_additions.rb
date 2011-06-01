#
module RmagickCaptcha
  module ModelAdditions
    # ::Rails.logger.error("...")

    module ClassMethods
      def has_rmagick_captcha(*symbols)
        symbols.each do |sym|
          define_method("#{sym}_key") do
            @attributes["#{sym}_key"]
          end
          define_method("#{sym}_key=") do |val|
            @attributes["#{sym}_key"]=val
          end
          define_method("#{sym}_text") do
            @attributes["#{sym}_text"]
          end
          define_method("#{sym}_text=") do |val|
            @attributes["#{sym}_text"]=val
          end

          #
          define_method("validate_rmagick_#{sym}") do
            text  = @attributes["#{sym}_text"]
            key = @attributes["#{sym}_key"]
            if ::Rails.env != 'test' && text != key
              self.errors.add(:"#{sym}_text")
              false
            end
          end

          #
          # First parameter should be options hash
          define_method("reset_#{sym}_key") do |*argv|
            result = ""
            parameter1 = argv.first || Hash.new
            options = ::RmagickCaptcha.options.merge(parameter1)
            options[:captcha_key_len].times do
              size = ::RmagickCaptcha.options[:random_chars].size;
              result << ::RmagickCaptcha.options[:random_chars][rand(size)]
            end
            @attributes["#{sym}_key"] = result
            @attributes["#{sym}_text"] = nil
            result
          end
        end
      end
    end


  end
end