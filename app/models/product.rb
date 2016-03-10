class Product < ActiveRecord::Base
  belongs_to :Catalog
  validates_attachment :cover, content_type: {content_type: /\Aimage\/.*\z/}

  validates :name, presence: true
  validates :amount, presence: true
  validates :price, presence: true

end
