module CurrentLineItem
  extend ActiveSupport::Concern

  private
  def set_cart
    @line_item= LineItem.find(session[:line_item_id])
  rescue
    @line_item = LineItem.create
    session[:line_item_id]=@line_item.id
  end
end