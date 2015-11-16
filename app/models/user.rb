class User < ActiveRecord::Base
  has_one :account
  
  validates :first_name, :last_name, presence: { message: 'Pole nie może być puste' }
  
  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
end
