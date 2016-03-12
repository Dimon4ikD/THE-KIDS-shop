class Role < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true

  scope :ordering, -> { order(:name) }
  validates :name, presence: true

end
