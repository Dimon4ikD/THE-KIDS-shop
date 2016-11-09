class Section < ActiveRecord::Base
  include PgSearch
  has_and_belongs_to_many :catalogs
end
