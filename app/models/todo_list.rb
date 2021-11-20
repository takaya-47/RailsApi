class TodoList < ApplicationRecord
  validates :todo, presence: true
end
