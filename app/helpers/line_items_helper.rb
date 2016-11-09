module LineItemsHelper


  def show_line_item(li)
    #render 'carts/cart', cart:cart
    if li.line_items.blank?
      text="Ваша корзина пуста"
      content_tag(:div,text,class:"alert alert-danger",id:"my_cart")
    else

      text="В корзине #{li.total_line_items} #{Russian.p(li.total_line_items,'товар','товара','товаров')} на сумму #{number_to_currency(li.total_amount)}"

      content_tag(:div,text,class:"alert alert-danger",id:"my_cart")
    end
  end

  def upd_line_item(li)
    "В корзине #{li.total_line_items} #{Russian.p(li.total_line_items,'товар','товара','товаров')} на сумму #{number_to_currency(li.total_amount)}"
  end


end
