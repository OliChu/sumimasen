class Recipe < ApplicationRecord
  has_many :measures
  has_many :ingredients, through: :measures
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :tools
  belongs_to :user
  has_attachments :photos, maximum: 10
end
