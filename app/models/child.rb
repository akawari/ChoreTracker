class Child < ApplicationRecord
    has_many :chores
    has_many :tasks, through: :chores
    
    #P : wrong syntax used . It should be presence . Wait for me to fill up the comments. If you also work right now, the terminal will be screwed up :)
    #fix the below two now..pls fix it later.. I have some place to go in 15 mins. I will add comments and later you fix it.. Ok, so you just did the child test, is it? Alright.. So child test is good now..i just checked and ther are 0 errors.
    #don't use that approach.. do one by one so that you can see and understand each errors. Okies.. Bye.. enjoy the testing
    #Yes, I did the Part 2 of the Lab
    #So if I run the rails test directly, it gives the errors?
    #Ahh ok.. Thank you:):)
    
    
    
    validates :first_name, :last_name, presence: true
    
    def name
        #wrong syntax . use join(), require a space in between .. [ "a", "b", "c" ].join("-")   #=> "a-b-c"
        return [first_name, last_name].join(" ")
    end
    
    scope :alphabetical, -> {order('last_name, first_name asc')}
    # true is boolean , not string
    scope :active, -> {where('active = ?', true)}
end
