require 'rails_helper'

RSpec.describe Client, type: :model do
  subject do
    Client.new(name:"New client",
              nip: 1234567890,
              email: 'mail@mail.com')
  end
  
  it { should respond_to :name }
  it { should respond_to :nip }
  it { should respond_to :email }
  
  context 'validations' do
    it { should validate_presence_of(:name).with_message("Pole nie może być puste") }
    it { should validate_presence_of(:nip).with_message("Pole nie może być puste") }
    it { should validate_presence_of(:email).with_message("Pole nie może być puste") }
    it { should validate_length_of(:nip) }
  end
  
  context 'associations' do
    it { is_expected.to have_many :companies }
    it { is_expected.to have_many :infos }
    it { is_expected.to have_one :address }
  end
  
  context 'nested attributes' do
    it { should accept_nested_attributes_for :address }
  end
  
end
