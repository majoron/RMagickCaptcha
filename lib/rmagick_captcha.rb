# Include
require 'rubygems'
require 'active_support'
require 'rmagick_captcha/model_additions'
require 'rmagick_captcha/controller_additions'
require 'rmagick_captcha/view_additions'
# require backends
require 'rmagick_captcha/rmagick_backend'

# = Rails breadcrumbs
#
module RmagickCaptcha
  # ::Rails.logger.error("...")

  # default options that can be overridden on the global level
  @@options = {
    :controller         => "rmagick_captcha",                           #
    :action             => "show",                                      #
    :id                 => "id",                                        #
    :captcha_key_len    => 4,                                           #
    :case_sensitive     => true,                                           #
    :random_chars       => "ABCDEFGHJKLMNPQRSTUVWXYZ" + "0123456789",   #
    :random_colors      => ["red", "blue", "green", "gray", "pink"],    #
    :img_format         => "png",                                       #
    :gc_width           => 200,                                         #
    :gc_height          => 100,                                         #
  }
  mattr_reader :options

  def self.enable_activerecord
    ActiveRecord::Base.send :include, RmagickCaptcha::ModelAdditions
    ActiveRecord::Base.send :extend, RmagickCaptcha::ModelAdditions::ClassMethods
  end

  def self.enable_actionpack
    ActionController::Base.send :include, RmagickCaptcha::ControllerAdditions
    ActionController::Base.send :extend, RmagickCaptcha::ControllerAdditions::ClassMethods
    ActionView::Base.send :include, RmagickCaptcha::ViewAdditions
  end

end

if defined? Rails
  RmagickCaptcha.enable_activerecord if defined? ActiveRecord
  RmagickCaptcha.enable_actionpack if defined? ActionController
end
