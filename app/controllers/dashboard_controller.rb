class DashboardController < ApplicationController

before_filter :authenticate_user!

def index
	@scrambles = current_user.scrambles
	@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user, owner_type: "User")
end


end
