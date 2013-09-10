class DashboardController < ApplicationController

before_filter :authenticate_user!

def index
	@scrambles = current_user.scrambles
end


end
