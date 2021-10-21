class User < ApplicationRecord
  has_many :microposts
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
