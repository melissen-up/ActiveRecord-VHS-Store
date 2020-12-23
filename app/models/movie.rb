class Movie < ActiveRecord::Base
    has_many :movie_genres
    has_many :genres, through: :movie_genres

    has_many :vhs
    has_many :rentals, through: :vhs
end

# READ

# Movie.available_now - returns a list of all movies currently available at the store

# Movie.most_clients ⭐️ - returns an instance of Movie that has been rentes by the most people

# Movie.most_rentals - returns a list of TOP3 All Time favorites based on number of rentals

# Movie.most_popular_female_director - returns a string that's a name of a director of the movie made by a female director with most Rentals

# Movie.newest_first - returns a list of all the movies from the most recent ones to the oldies but goldies based on the release year

# Movie.longest - returns a list of the movies from the longest to the shortest

# Movie#recommendation - prints a recommendation that includes a random emoji next to the title, and in new lines: the movie description, its length, director and year of release

# Movie.surprise_me - prints a recommendation for a random movie

# DELETE

# Movie#report_stolen - deletes a random vhs instance associated with this movie that's currently not rented out and prints information: "THANK YOU FOR YOUR REPORT. WE WILL LAUNCH AN INVESTIGATION."