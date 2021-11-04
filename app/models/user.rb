class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :microposts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  acts_as_voter
  # acts_as_votable
end
