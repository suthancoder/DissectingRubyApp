class ApplicationController < ActionController::Base


  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include SetDefaultAttributes

end
