class Child < ApplicationRecord
    #Relationship Testing
    has_many :chores
    has_many :tasks, through: :chores
    
    #Validation Testing
    validates :first_name, :last_name, presence: true
    
    def name
        #wrong syntax . use join(), require a space in between .. [ "a", "b", "c" ].join("-")   #=> "a-b-c"
        return [first_name, last_name].join(" ")
    end
    
    #Scope Testing
    scope :alphabetical, -> {order('last_name, first_name asc')}
    scope :active, -> {where('active = ?', true)}
end
