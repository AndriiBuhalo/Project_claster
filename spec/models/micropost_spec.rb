require 'rails_helper'

RSpec.describe Micropost, type: :model do
    it 'microposts is validate test ' do
      micropost = FactoryBot.build(:micropost).save!
      ap micropost
      expect(micropost).to eq(true)
    end

  
end
