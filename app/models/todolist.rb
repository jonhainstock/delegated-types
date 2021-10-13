class Todolist < ApplicationRecord
  include Recordable

  validates_presence_of :name, :description
end
