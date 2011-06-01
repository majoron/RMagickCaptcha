require 'spec_helper'

describe RmagickCaptcha do
  it "should define rails" do
    ::Rails::VERSION::MAJOR.should be
  end
end
