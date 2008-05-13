# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require 'localization' 
require 'user_system'
require 'environment.rb'

class ApplicationController < ActionController::Base

  include Localization
  include UserSystem

  require_dependency 'user'

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'd8f8fde8cfa2f32f765ec02a5270fb08'

end
