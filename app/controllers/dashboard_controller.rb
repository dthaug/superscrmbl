class DashboardController < ApplicationController

def index
	@scrambles = current_user.scrambles
end


end
