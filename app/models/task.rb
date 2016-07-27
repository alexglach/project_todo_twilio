class Task < ActiveRecord::Base
  validates :description, length: { minimum: 4 }
  validates :priority, :uniqueness => true
end
