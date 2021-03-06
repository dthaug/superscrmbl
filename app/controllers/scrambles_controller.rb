class ScramblesController < ApplicationController

  skip_before_filter :verify_authenticity_token
  #before_filter      :authenticate_user!, :only => :show, :unless => :in_production
  before_filter :authenticate_user!, except: [:show]
  impressionist :actions => [:show]

  def index
    @scrambles = Scramble.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scrambles.to_json }
    end
  end


  def show
    @scramble = Scramble.find(params[:id])
 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scramble.to_json }
    end
  end

  def new
    @scramble = current_user.scrambles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scramble.to_json }
    end
  end

  def edit
    @scramble = current_user.scrambles.find(params[:id])
  end

  def create
    #respond_with current_user.scrambles.new(params[:scramble])
    @scramble = current_user.scrambles.new(params[:scramble])


    respond_to do |format|
      if @scramble.save
        format.html { redirect_to @scramble, notice: 'Scramble was successfully created.' }
        format.json { render json: @scramble, status: :created, location: @scramble }
      else
        format.html { render action: "new" }
        format.json { render json: @scramble.errors, status: :unprocessable_entity }
      end
    end


  end

  def update
    @scramble = current_user.scrambles.find(params[:id])

    respond_to do |format|
      if @scramble.update_attributes(params[:scramble])
        format.html { redirect_to @scramble, notice: 'Scramble was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scramble.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @scramble = current_user.scrambles.find(params[:id])
    @scramble.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

end
