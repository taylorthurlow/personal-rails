class Project < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
