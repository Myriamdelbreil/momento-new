class ApplicationController < ActionController::Base
  # include ActiveDevice
  # skip_before_filter :set_mobile_format
  include Browser
end
