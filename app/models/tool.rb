class Tool < ApplicationRecord
  has_and_belongs_to_many :recipes
  has_attachment :photo
end
