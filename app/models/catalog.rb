class Catalog < ActiveRecord::Base
  has_and_belongs_to_many :sections
  has_ancestry

  validates :name, presence: true

  validates :description, presence: true


end
