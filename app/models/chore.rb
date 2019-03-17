class Chore < ApplicationRecord
    #Relationships Testing:
    belongs_to :child
    belongs_to :task
    
    #Validations Testing:
    validates_date :due_on
    
    #timeliness: { on_or_after: lambda { 1.day.ago.to_date }, type: :date }
    #validates :due_on, timeliness: { on_or_before: lambda { 1.day.from_now.to_date }, type: :date }
    #validates :due_on, timeliness: { is_at: lambda { Date.current }, type: :date }
    
    #Scopes Testing:
    
    scope :by_task, -> {joins(:task).order('name asc') }
    scope :chronological, -> { order(:due_on, :completed)}
    scope :pending, -> {where('completed = ?', false)}
    scope :done, -> {where('completed = ?', true)}
    scope :upcoming, -> {where('due_on >= ?', Date.current)}
    scope :past, -> {where('due_on < ?', Date.current)}
    
    def status
        if self.completed
            "Completed"
        else
            "Pending"
        end
    end
end
