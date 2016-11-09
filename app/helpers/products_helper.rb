module ProductsHelper

  def select_user(user, selected = nil)
    select_tag(user, options_for_select(
      User.product_order('email').load.map{ |x| [x.email, x.id] } + [['', nil]], [selected]))
  end

  def select_product(name, selected = nil)
    select_tag(name, options_for_select(Product.order('name').load.map{ |x| [x.name, x.id] } + [['', nil]],[selected]))
  end


end
