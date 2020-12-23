class Vhs < ActiveRecord::Base
    after_initialize :add_serial_number

    belongs_to :movie
    has_many :rentals
    has_many :clients, through: :rentals

    def self.available_now
        Rental.all.select{|rental| rental.current == true}
    end
    
    private


    # generates serial number based on the title
    def add_serial_number
        serial_number = serial_number_stub
        # Converting to Base 36 can be useful when you want to generate random combinations of letters and numbers, since it counts using every number from 0 to 9 and then every letter from a to z. Read more about base 36 here: https://en.wikipedia.org/wiki/Senary#Base_36_as_senary_compression
        alphanumerics = (0...36).map{ |i| i.to_s 36 }
        13.times{|t| serial_number << alphanumerics.sample}
        self.update(serial_number: serial_number)
    end

    def long_title?
        self.movie.title && self.movie.title.length > 2
    end

    def two_part_title?
        self.movie.title.split(" ")[1] && self.movie.title.split(" ")[1].length > 2
    end

    def serial_number_stub
        return "X" if self.movie.title.nil?
        return self.movie.title.split(" ")[1][0..3].gsub(/s/, "").upcase + "-" if two_part_title?
        return self.movie.title.gsub(/s/, "").upcase + "-" unless long_title?
        self.movie.title[0..3].gsub(/s/, "").upcase + "-"
    end
end

# CREATE

# Vhs.hot_from_the_press - accepts arguments used to create a new instance of a Movie and a name of a genre; creates the movie, associates it with appropriate genre (if it exists, if it doesn't - creates one) and creates three instances of a Vhs associated with that Movie

# READ

# Vhs.most_used - prints a list of 3 vhs that have been most rented in the format: "serial number: 1111111 | title: 'movie title'

# Vhs.all_genres - returns a list of all genres available at the store
# Vhs.available_now - returns a list of all vhs currently available at the store