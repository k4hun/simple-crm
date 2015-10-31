class Membership < ActiveRecord::Base
  belongs_to :user
  
  SYSTEM_ROLES = %w(admin user)
  
  validates :role, presence: true
  validates :role, inclusion: { in: SYSTEM_ROLES }
end
