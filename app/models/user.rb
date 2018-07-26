class User < ApplicationRecord
  rolify
  has_many:orders
  has_many:carts
  has_many:posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
