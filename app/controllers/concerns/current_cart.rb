module CurrentCart
  extend ActiveSupport::Concern

  private
  def set_cart
    @cart = Cart.find(welcome[:cart_id])
  rescue
    @cart = Cart.create
    welcome[:cart_id]=@cart.id
  end
end