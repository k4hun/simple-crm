class Membership < ActiveRecord::Base
  after_initialize :default_role
  belongs_to :account
  
  SYSTEM_ROLES = %w(admin user)
  
  validates :role, presence: true
  validates :role, inclusion: { in: SYSTEM_ROLES }
  
  def default_role
    self.role ||= 'user'
  end
  
  def make_admin
    self.role = 'admin'
    self.save
  end
end
