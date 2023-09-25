class Category < ApplicationRecord
  has_and_belongs_to_many :dealings

  validates :name, presence: true
  validates :icon, presence: true
end
