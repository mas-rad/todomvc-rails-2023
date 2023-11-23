class Todo < ApplicationRecord
  # TODO 1
  validates :title, presence: true
  # TODO 2
  normalizes :title, with: -> title {title.strip}  
end
