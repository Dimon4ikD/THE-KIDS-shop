class Banner < ActiveRecord::Base
  has_attached_file :image, styles: {medium: {height: "1100x230"}, thumb: "150x450>"}

  belongs_to :catalog
  validates_attachment :image, content_type: {content_type: /\Aimage\/.*\z/}
  validates :frequency, numericality: {less_than_or_equal_to: 60000, greater_than_or_equal_to: 0}, allow_blank: true
  validates :click, numericality: {only_integer: true, greater_than_or_equal_to: 0}, presence: true

  def can_show?
    self.frequency>0
  end

  before_save :def_null

  def decrease_f
    if self.frequency!=0
      self.update(frequency: self.frequency-1)
    end
  end

  def def_null
    self.click=0
  end

  def self.manage?(u)
    u.try(:is_admin?)
  end

end
# private
# def check_s_date
#   errors.add(:start_date, :invalid) if start_date && start_date>Time.now
#   true
# end
#
# def check_e_date
#   errors.add(:end_date, :invalid) if end_date && end_date<Time.now
#   true
# end