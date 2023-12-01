class Todo < ApplicationRecord
  scope :active, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
  # TODO

  validates :title, presence: true

  normalizes :title, with: ->(title) { title.strip }
end
