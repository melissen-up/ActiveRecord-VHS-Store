class Genre < ActiveRecord::Base
    has_many :movie_genres
    has_many :movies, through: :movie_genres
end

# READ

# Genre.most_popular - returns a list of 5 most popular genres based on number of movies
# Genre.longest_movies - returns a genre whose movies length average is the highest (remember to also test it with an instance of a Genre that does not have any movies associated)