class Catalog < ActiveRecord::Base
  include PgSearch
  has_and_belongs_to_many :sections
  has_and_belongs_to_many :catalogs
  has_many :products
  has_ancestry
  scope :ordering, -> { order(:name) }

  multisearchable :against => [:name]

  validates :name, presence: true

  validates :description, presence: true

  # def content=(val)
  #   self.HyTML=val
  #
  #
  # end

end
