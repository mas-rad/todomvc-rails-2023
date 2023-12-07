class Todo < ApplicationRecord
  scope :active, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }

  validates :title, presence: true

  normalizes :title, with: ->(title) { title.strip }

  def self.toggle_all!
    if (Todo.active.any?)
      Todo.update_all completed: true
    elsif
      Todo.update_all completed: false
    end
  end
end
