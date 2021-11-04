class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, :context, presence: true
  has_one_attached :cover_picture

  # acts_as_voter
  acts_as_votable
end
