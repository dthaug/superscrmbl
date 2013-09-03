class MilestonesController < ApplicationController
  skip_before_filter :verify_authenticity_token
	before_filter(:get_scramble)

	def show
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @milestone.to_json }
    end
  end

  def new
      @scramble = Scramble.find(params[:scramble_id])
      @milestone = @scramble.milestones.build
    #       respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @milestone.to_json }
    # end
  end

  def create
    @scramble = Scramble.find(params[:scramble_id])
    @milestone = @scramble.milestones.build(params[:milestone])

    respond_to do |format|
    if @milestone.save
        #format.html { redirect_to @scramble,
                     #notice: 'Order was successfully created.' }
        format.json { render json: @milestone,
                             status: :created}
    else
        format.html { render action: "new" }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
       end
     end
  end

def get_scramble
    @scramble = Scramble.find(params[:scramble_id])
  end

end
