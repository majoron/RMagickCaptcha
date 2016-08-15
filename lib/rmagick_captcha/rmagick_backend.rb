require 'rmagick'
require 'RMagick' unless defined?(Magick)

module RmagickCaptcha
  module RmagickBackend
    # ::Rails.logger.error("...")


    def self.get_captcha_image (key, options = {})
      options = ::RmagickCaptcha.options.merge(options)
      canvas = ::Magick::Image.new(options[:gc_width], options[:gc_height],
        Magick::HatchFill.new('white','lightcyan2'))


      gc = ::Magick::Draw.new
      draw_text(key, gc, options)

      gc.push
      gc.fill('blue')
      gc.fill_opacity(0.3)
      gc.bezier(0,options[:gc_height],rand(40),rand(30),rand(options[:gc_width]),
                1,options[:gc_width],options[:gc_height])
      gc.pop

      gc.push
      gc.fill('green')
      gc.fill_opacity(0.4)
      gc.bezier(0,0,rand(10),rand(40)+20,rand(40)+20,rand(40)+20,options[:gc_width],0)
      gc.pop

      gc.draw(canvas)

      canvas.format= options[:img_format]
      return canvas.to_blob()
    end

    private

    def self.draw_text(text, gc, options)
      gc.push
      gc.stroke_width=2
      gc.stroke(random_color(options))
      gc.font_family= options[:font_family]
      gc.font_stretch = Magick::UltraExpandedStretch
      gc.font_style = Magick::NormalStyle
      gc.font_weight = Magick::NormalWeight
      gc.gravity = Magick::WestGravity
      idx = 25
      text.each_char do | sym |
        gc.skewx( random_mod( rand(7) + 1 ) )
        gc.skewy( random_mod( rand(5) + 1 ) )
        gc.pointsize=rand(10)+30
        gc.fill(random_color(options))
        gc.text(idx,0,sym)
        idx+=25
      end
      gc.pop
    end

    def self.random_color(options = {})
      options[:random_colors][rand(options[:random_colors].size)]
    end

    def self.random_mod(val)
      return (rand(50) > 25 ? 1:-1)*val
    end


  end
end
