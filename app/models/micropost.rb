class Micropost < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, :context, presence: true
  has_one_attached :cover_picture

end
