class ProductOrder < ActiveRecord::Base
  belongs_to :User
  belongs_to :Product
  belongs_to :LineItem



  after_create :send_mail
  after_create :decrease_q
  # belongs_to :cart, ->{includes(:line_items => :product).order(:created_at)}

  # belongs_to :book_exemplar
  has_many :line_items, dependent: :destroy
  scope :ordering, -> {order(created_at: :desc)}

  # STATUSES=%w(Оформлен Подтверждён Отменён Доставляется Завершён) #0 1 2 3 4

  validates :user, presence: true
  validates :address, presence: true
  # validates :comment


  #some testing metods

  validate :check_cart

  def check_cart
    if cart && cart.line_items.blank?
      errors.add(:line_item, "Корзина пуста!")
    end
  end

  def decrease_q
    # self.cart.line_items.book.update()
    cart.line_items.each do |t|
      if t.product.amount!=0
        t.product.update(amount: t.product.amount-t.quantity)
        # t.book.amount-=t.quantity
        # t.book.save
      else puts "Товаров больше нет!"

      end
    end
  end



  def send_mail
    ProductOrderMailer.info_email(self).deliver_later
    true
  end



end
