class User < ApplicationRecord
  has_many :recipes
  has_many :meals
  has_secure_password
end
