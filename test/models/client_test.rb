require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test 'has all fields but comment' do
  	user = Client.new
  	assert user.invalid?
  	assert user.errors[:firstname].any?
  	assert user.errors[:lastname].any?
  	assert user.errors[:nip].any?
  end  
end
