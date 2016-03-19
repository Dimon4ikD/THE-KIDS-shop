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
      errors.add(:cart, "Корзина пуста!")
    end
  end

  def decrease_q
    # self.cart.line_items.book.update()
    cart.line_items.each do |t|
      if t.book.amount!=0
        t.book.update(amount: t.book.amount-t.quantity)
        # t.book.amount-=t.quantity
        # t.book.save
      else puts "Книг больше нет!"

      end
    end
  end


  def add_lineitems(cart)
    line_items=[]
    cart.line_items.each do |l_i|
      l_i.cart_id=nil
      line_items << l_i
    end
  end
  def send_mail
    BookOrderMailer.info_email(self).deliver_later
    true
  end



end
