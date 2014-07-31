class Aircraft < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2 }
  validates :color, presence: true, length: { minimum: 2 }
end
