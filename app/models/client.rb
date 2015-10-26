class Client < ActiveRecord::Base
    has_one :address, dependent: :destroy
    has_many :companies, dependent: :destroy
    
    accepts_nested_attributes_for :address
    
    validates :firstname, :lastname, :nip, presence: { message: 'Pole nie może być puste' }
    validates :nip, uniqueness: true
    validates :nip, length: { is: 10 }

    def full_name
    	return "#{self.firstname} #{self.lastname}"
    end
end
