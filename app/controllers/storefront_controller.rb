class StorefrontController < ApplicationController

  def all_vendors
  	@vendors = Vendor.all
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