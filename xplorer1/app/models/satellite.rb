class Satellite < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5}
  validates :description, presence: true
end
