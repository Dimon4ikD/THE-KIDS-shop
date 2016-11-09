class Product < ActiveRecord::Base
  belongs_to :Catalog
  has_many :Covers
  has_many :line_items, dependent: :nullify
  has_attached_file :cover
  validates_attachment :cover, content_type: {content_type: /\Aimage\/.*\z/}


  validates :name, presence: true
  validates :amount, numericality:{only_integer: true}
  validates :price, presence: true, numericality:{greater_than: 0}


  def self.manage?(u)
    u.try(:is_admin?)
  end

  def can_destroy?
    line_items.blank?
  end

  def can_sell?
    amount>0
  end

end
