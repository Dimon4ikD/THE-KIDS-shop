class Role < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true

  scope :ordering, -> { order(:name) }


end
