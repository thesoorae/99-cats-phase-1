class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: { in: ["M", "F"], message: "%{value} is not a valid input"}

  has_many :cat_rental_requests,
  :dependent => :destroy



end
