class User < ActiveRecord::Base
  authenticates_with_sorcery!

  cattr_reader :roles
  @@roles=%w(Пользователь Администратор)

  validates :name, presence: true, length: {minimum: 2, maximum: 255}
  validates :email, presence: true, uniqueness: {case_sensitive: false},
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :role, presence: true, inclusion: {in: 0...@@roles.size}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 3}, confirmation: true,
            if: Proc.new { |u| u.new_record? or !u.password.blank? }

  before_validation :set_default_role

  scope :ordering,->{order(:name)}

  def is_admin?()
    true
  end

  def role_name
    role && @@roles[role]
  end

  def set_default_role
    self.role||=0
  end

end
