class Cart < ActiveRecord::Base
  has_many :line_items, ->{includes(:product).order(:created_at)}, dependent: :destroy
  has_one :product_order, dependent: :destroy

  def add_item(p)
    line_item = line_items.where(product_id: p.id).first
    unless line_item
      line_item = self.line_items.build(product: p, quantity: 0, price: p.price)
    end
    line_item.quantity+=1
    line_item.save
  end

  def total_line_items
    line_items.sum(:quantity)
  end

  def total_amount
    self.line_items.sum("quantity*line_items.price")
  end

  def all_summ
    a=0
    self.line_items.each{|item| a+=item.price * item.quantity}
    a
  end
end