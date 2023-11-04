class Todo < ApplicationRecord
  validates :title, presence: true

  normalizes :title, with: ->(title) { title.strip }
end
