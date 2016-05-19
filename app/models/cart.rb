class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, :dependent => :destroy

  def subtotal
  	line_items.to_a.sum { |item| item.total_price }
  end

  def add_product(product_id)
  	current_item = line_items.find_by(product_id: product_id)
  	if current_item 
  		current_item.quantity += 1
  	else
  		current_item = line_items.build(product_id: product_id)
  	end

    return current_item
  end

  def order_complete
  @cart = Cart.find(params[:cart_id])
  @amount = (@cart.subtotal.to_f.round(2) * 100).to_i

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
  @cart.destroy

	rescue Stripe::CardError => e
  		flash[:error] = e.message
  		redirect_to new_charge_path
	end
end
