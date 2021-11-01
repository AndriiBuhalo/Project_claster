class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :content, :context, presence: true
end
