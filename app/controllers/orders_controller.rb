class OrdersController < ApplicationController

  before_filter(:get_scramble)
  before_filter :authenticate_user!

  def index
    @orders = @scramble.orders.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def show
    @order = @scramble.orders.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order.to_json }
    end
  end

  def new
      @scramble = Scramble.find(params[:scramble_id])
      @order = @scramble.orders.build

  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @scramble = Scramble.find(params[:scramble_id])
    @order = @scramble.orders.build(params[:order])

    respond_to do |format|
    if @order.save
        @order.create_activity :create, owner: current_user
        format.html { redirect_to @scramble,
                     notice: 'Order was successfully created.' }
        format.json { render json: [@scramble, @order],
                             status: :created,
                             location: [@scramble, @order] }
    else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
       end
     end
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    @order.create_activity :destroy, owner: current_user

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

    private
def get_scramble
    @scramble = Scramble.find(params[:scramble_id])
  end


end
