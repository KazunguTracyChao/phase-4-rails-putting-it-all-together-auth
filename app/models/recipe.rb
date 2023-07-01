class Recipe < ApplicationRecord
    belongs_to :user
  
    validates :title, presence: true
    validates :instructions, presence: true, length: {minimum: 50}
    validates :minutes_to_complete, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  end