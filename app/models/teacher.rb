class Teacher < ApplicationRecord
    has_one :pod
    validates :grade, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    
end
