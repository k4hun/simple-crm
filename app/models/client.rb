class Client < ActiveRecord::Base
    has_one :address, dependent: :destroy
    has_many :companies, dependent: :destroy
    has_many :infos, dependent: :destroy
    
    accepts_nested_attributes_for :address
    
    validates :name, :nip, :email, presence: { message: 'Pole nie może być puste' }
    validates :email, format: { with: (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/), message: 'Zły format adresu email!' }
    validates :nip, uniqueness: { message: 'Nr NIP znajduje się już w bazie' }
    validates :nip, length: { is: 10 }
    validates :nip, format: { with: /\A\d{10}\z/, message: 'NIP musi składać się z 10 cyfr' }
end
