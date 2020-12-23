class Rental < ActiveRecord::Base

    belongs_to :client
    belongs_to :vhs

    def due_date
       self.created_at+7.day
    end

end

# X Rental#due_date - returns a date one week from when the record was created
# `Rental.past_due_date` - returns a list of all the rentals past due date, currently rented or rented in the past