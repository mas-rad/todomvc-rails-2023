class Todo < ApplicationRecord
  scope :active, -> { where(completed: false) }
  # TODO

  validates :title, presence: true

  normalizes :title, with: ->(title) { title.strip }
end
