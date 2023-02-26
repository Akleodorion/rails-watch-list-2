require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Movie.delete_all
n = 1

20.times do
  url = "https://api.themoviedb.org/3/movie/top_rated?api_key=abdbe1e8da7f6e8701dcf6048943a0ed&language=en-US&page=#{n}"
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)["results"]

  movies.each do |movie|
    Movie.create(title: movie["title"], overview: movie["overview"], rating: movie["vote_average"], poster_url: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2#{movie['poster_path']}")
  end
  n += 1
end
