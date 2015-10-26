class Address < ActiveRecord::Base
    belongs_to :client
    belongs_to :company

    validates :street, :zip_code, :city, :voivodeship, presence: { message: 'Pole nie może być puste' }
    validates :zip_code, format: { with: /\A\d{2}-\d{3}\z/, message: 'Kod pocztowy musi być w formacie xx-xxx' }
end
