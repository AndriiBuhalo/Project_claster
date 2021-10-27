require 'rails_helper'

RSpec.describe User, type: :model do
  # it 'returns the user'do
  #   user = build(:user, name: 'Anton', email: 'anton@gmail.com')

  #   expect(user.name).to eq 'Anton'
  #   expect(user.email).to eq 'anton@gmail.com'
  # end
 
  context "validation tests" do
    # it 'ensures name presence' do
    #   user = User.new( email: 'anton@gmail.com').save
    #   expect(user).to eq(false)
    # end

    # it 'ensures email presence' do
    #   user = User.new( name: 'Anton').save
    #   expect(user).to eq(false)
    # end

    # it 'should save successfully' do  
    #   user = User.new(name: 'Anton', email: 'anton@gmail.com').save
    #   expect(user).to eq(true)
    # end

    #or
    it 'user is validate test ' do
      user = FactoryBot.build(:user).save
      expect(user).to eq(true)
    end

    it 'user is not validate test' do
      user = User.new().save
      expect(user).to eq(false)
    end
  end
  
  

end

