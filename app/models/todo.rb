class Todo < ApplicationRecord
  # TODO 1
  normalizes :title, with: -> title { title.strip }
  # TODO 2
  validates :title, presence: true
end
