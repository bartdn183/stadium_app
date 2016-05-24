class StorefrontController < ApplicationController
  def welcome
    @stadia = Stadium.all
  end

  def all_vendors
    @stadia = Stadium.find(params[:stadium_id])
    @vendors = Vendor.all
    @vendors_by_stadium = []

    @vendors.each do |vendor|
      if vendor.stadium.id == params[:stadium_id].to_i
        @vendors_by_stadium.push(vendor)
      end
    end
  end

  def show
  	@vendor = Vendor.find(params[:vendor_id])
  	@products = Product.all
  	@products_by_vendor = []

  	@products.each do |product|
  		if product.vendor.id == params[:vendor_id].to_i
  			@products_by_vendor.push(product)
  		end
  	end
  end
end