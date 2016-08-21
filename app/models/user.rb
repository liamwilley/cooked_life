class User < ApplicationRecord
  has_many :recipes


  def full_name
    "#{first_name} #{last_name}"
  end
end
