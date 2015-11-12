class User < ActiveRecord::Base
  has_one :account
  
  validates :first_name, :last_name, presence: { message: 'Pole nie może być puste' }
end
