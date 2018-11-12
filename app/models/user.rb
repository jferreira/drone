class User < ApplicationRecord
  has_many :packages
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :packages
  has_many :bookings, through: :packages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
