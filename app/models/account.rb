class Account < ActiveRecord::Base
  include PublicActivity::Model

  before_validation :add_membership
  has_secure_password
  
  belongs_to :user
  has_one :membership, dependent: :destroy
  accepts_nested_attributes_for :user

  validates :user, :membership, :email, :password, presence: { message: 'Pole nie może być puste' }

  def self.authenticate(email, password)
    account_check = self.where(email: email).first
    account_check.authenticate(password) if account_check
  end
  
  def add_membership
    build_membership
  end
end
