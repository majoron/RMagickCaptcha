# Include gems
require "rubygems"
# TODO: check
# require "RMagick"

# todo: place srand() during plugin startup

# CaptchaValidateable
module RMagickCaptcha
  @@gc_width = 200
  mattr_accessor :gc_width

  @@gc_height = 100
  mattr_accessor :gc_height

  @@img_format = "png"
  mattr_accessor :img_format

  @@random_chars = "ABCDEFGHJKLMNPQRSTUVWXYZ" + "0123456789"
  mattr_accessor :random_chars

  @@random_colors = ["red", "blue", "green", "gray", "pink"]
  mattr_accessor :random_colors


  def self.included(target)
    target.extend(ClassMethods)
  end

  module ClassMethods
    def get_random_string (len = 10)
      result = ""
      len.times do
        result << CaptchaValidateable.random_chars[rand(CaptchaValidateable.random_chars.size)]
      end
      result
    end

    def get_captcha_key (len = 5)
      result = ""
      len.times do
        result << CaptchaValidateable.random_chars[rand(CaptchaValidateable.random_chars.size)]
      end
      result
    end

    def get_captcha_image (key)
      canvas = Magick::Image.new(CaptchaValidateable.gc_width, CaptchaValidateable.gc_height,
        Magick::HatchFill.new('white','lightcyan2'))

      gc = Magick::Draw.new
      draw_text(key, gc)

      gc.push
      gc.fill('blue')
      gc.fill_opacity(0.3)
      gc.bezier(0,CaptchaValidateable.gc_height,rand(40),rand(30),rand(CaptchaValidateable.gc_width),
                1,CaptchaValidateable.gc_width,CaptchaValidateable.gc_height)
      gc.pop

      gc.push
      gc.fill('green')
      gc.fill_opacity(0.4)
      gc.bezier(0,0,rand(10),rand(40)+20,rand(40)+20,rand(40)+20,CaptchaValidateable.gc_width,0)
      gc.pop

      gc.draw(canvas)

      canvas.format= CaptchaValidateable.img_format
      return canvas.to_blob()

    end

    def random_mod(val)
      return (rand(50) > 25 ? 1:-1)*val
    end

    def random_color()
      return CaptchaValidateable.random_colors[rand(CaptchaValidateable.random_colors.size())]
    end

    def draw_text(text, gc)
      gc.push
      gc.stroke_width=2
      gc.stroke(random_color())
      # gc.font_family="times"
      gc.font_family="verdana"
      gc.font_stretch = Magick::UltraExpandedStretch
      gc.font_style = Magick::NormalStyle
      gc.font_weight = Magick::NormalWeight
      gc.gravity = Magick::WestGravity
      idx = 25
      text.each_char do | sym |
        gc.skewx( random_mod( rand(7) + 1 ) )
        gc.skewy( random_mod( rand(5) + 1 ) )
        gc.pointsize=rand(10)+30
        gc.fill(random_color())
        gc.text(idx,0,sym)
        idx+=25
      end
      gc.pop
    end
  end
end
