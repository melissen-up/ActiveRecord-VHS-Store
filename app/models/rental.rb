class Rental < ActiveRecord::Base

    belongs_to :client
    belongs_to :vhs

end

# Rental#due_date - returns a date one week from when the record was created