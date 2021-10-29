class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :content, :context, presence: true
end
