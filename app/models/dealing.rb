class Dealing < ApplicationRecord
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :amount, presence: true
end
