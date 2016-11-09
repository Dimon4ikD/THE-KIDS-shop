class Product < ActiveRecord::Base
  include PgSearch
  paginates_per 7

  belongs_to :catalog
  has_many :covers
  has_many :line_items, dependent: :nullify
  has_attached_file :cover
  validates_attachment :cover, content_type: {content_type: /\Aimage\/.*\z/}

  before_destroy :can_destroy?

  validates :name, presence: true, :uniqueness => true
  validates :amount, numericality:{only_integer: true}
  validates :price, presence: true, numericality:{greater_than: 0}

  # pg_search_scope :search_title, :against => [:title]

  multisearchable :against => [:name]

  # pg_search(
  #   :search,
  #   against: %i(
  #     section
  #     catalog
  #     name
  #   ),
  #   using: {
  #     tsearch: {
  #       dictionary: "russian",
  #     }
  #   }
  # )


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
