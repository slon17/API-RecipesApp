class Recipe < ApplicationRecord
  #serialize :ingredients, Array
  #serialize :images, Array

  validates :name, presence: true, uniqueness: true

end
