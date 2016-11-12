class Movie < ApplicationRecord
  validates :title, :avatar, presence: true
  validates :rating, numericality: {
                                    only_integer: true,
                                    less_than_or_equal_to: 10
                                  }, presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", regular: "200x200>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
