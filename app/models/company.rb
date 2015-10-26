class Company < ActiveRecord::Base
	belongs_to :client
	has_one :address
end
