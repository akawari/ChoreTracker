class Task < ApplicationRecord
    #Relationships Testing:
    has_many :chores
    has_many :children, through: :chores
    
    #Validation Testing:
    validates :name, presence: true
    validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
    #Scopes Testing:
    scope :alphabetical, -> {order('name asc')}
    scope :active, -> {where('active = ?', true)}
end
