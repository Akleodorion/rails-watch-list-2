class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, :list, presence: true, uniqueness: { scope: %i[movie list] }
  validates :comment, length: { minimum: 6 }, presence: true
end
