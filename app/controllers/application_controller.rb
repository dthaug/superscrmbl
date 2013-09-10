class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  protect_from_forgery

  hide_action :current_user


end
