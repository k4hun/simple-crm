class Membership < ActiveRecord::Base
  belongs_to :account
  
  SYSTEM_ROLES = %w(admin user)
  
  validates :role, presence: true
  validates :role, inclusion: { in: SYSTEM_ROLES }
end
