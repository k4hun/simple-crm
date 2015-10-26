class Address < ActiveRecord::Base
    belongs_to :client
    belongs_to :company

    VOIS = %w( dolnoslaskie kujawsko-pomorskie lubelskie lubuskie lodzkie
    	malopolskie mazowieckie opolskie podkarpackie podlaskie pomorskie slaskie
    	swietokrzyskie warminsko-mazurskie wielkopolskie zachodniopomorskie ) 

    validates :street, :zip_code, :city, :voivodeship, presence: { message: 'Pole nie może być puste' }
    validates :zip_code, format: { with: /\A\d{2}-\d{3}\z/, message: 'Kod pocztowy musi być w formacie xx-xxx' }
    validates :voivodeship, inclusion: { in: VOIS }
end
