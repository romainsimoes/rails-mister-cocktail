class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates_uniqueness_of :name

  mount_uploader :photo, PhotoUploader
end
