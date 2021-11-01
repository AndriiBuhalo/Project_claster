class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    has_many :microposts
    has_many :comments
end
