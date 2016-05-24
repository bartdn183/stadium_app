class VendorsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /vendors
  def index
    @vendors = Vendor.all
  end

  # GET /vendors/1
  def show
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
    @stadia = Stadium.all
  end

  # GET /vendors/1/edit
  def edit
    @stadia = Stadium.all
  end

  # POST /vendors
  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /vendors/1
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /vendors/1
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:name, :stadium_id,:image)
    end
end
