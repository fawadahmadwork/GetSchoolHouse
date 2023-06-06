class Child < ApplicationRecord

belongs_to :user
validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 6, less_than_or_equal_to: 13 }
end
