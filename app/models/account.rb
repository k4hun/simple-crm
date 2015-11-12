class Account < ActiveRecord::Base
  has_secure_password
  belongs_to :user
  has_one :membership
  accepts_nested_attributes_for :user

  validates :user, :email, :password, presence: { message: 'Pole nie może być puste' }

  def self.authenticate(email, password)
    account_check = self.where(email: email).first
    account_check.authenticate(password) if account_check
  end
end
