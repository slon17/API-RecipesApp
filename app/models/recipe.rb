class Recipe < ApplicationRecord
  serialize :ingredients, Array
  serialize :steps, Array
  serialize :images, Array

  validates :name, presence: true, uniqueness: true

end
