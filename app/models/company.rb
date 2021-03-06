class Company < ActiveRecord::Base
  include PublicActivity::Model

	belongs_to :client
	has_one :address, dependent: :destroy
	has_many :infos

	accepts_nested_attributes_for :address

	validates :name, :end_date, presence: { message: 'Pole nie może być puste'}
	validates :end_date,
          date: { after: Proc.new { Time.now + 1.month},
                  message: 'Umowa musi trwać przynajmniej miesiąc'}
end
