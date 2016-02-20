class ProductOrder < ActiveRecord::Base
  belongs_to :User
  belongs_to :Product
  belongs_to :LineItem
end
