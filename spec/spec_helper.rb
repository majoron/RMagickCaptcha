$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__), '../lib')
$:.unshift File.join(File.dirname(__FILE__), '../app/controllers')

ENV["RAILS_ENV"] = "test"
require 'rubygems'
require 'rspec'
require 'action_controller'
require 'rmagick_captcha'

module Rails
  module VERSION
    MAJOR = 3
  end
end unless defined? Rails

# RailsBreadcrumbs.root = './'
RAILS_ROOT = './' unless defined?(RAILS_ROOT)
RAILS_ENV = 'test' unless defined?(RAILS_ENV)

RSpec.configure do |config|
  config.mock_with :rspec
end
