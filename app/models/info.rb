class Info < ActiveRecord::Base
  belongs_to :client
  belongs_to :company
  
  TYPES = %w( telefon fax email )
  validates :info_type, :value, presence: { message: 'Pole nie może być puste' }
  validates :info_type, inclusion: { in: TYPES }
end
