class Movie < ApplicationRecord
  validates :title, presence: true
  validates :rating, numericality: {
                                    only_integer: true,
                                    less_than_or_equal_to: 10
                                   }
  validates_presence_of :rating
end
