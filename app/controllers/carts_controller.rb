class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  def show
    unless current_user.id == @cart.user_id
      flash[:notice] = "You don't have access to that order!"
      redirect_to root_path
    end
  end
  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /carts/1
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id)
    end
end
