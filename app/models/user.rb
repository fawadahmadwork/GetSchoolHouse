class User < ApplicationRecord
  has_many :children, dependent: :destroy
  validates :name, :address, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
