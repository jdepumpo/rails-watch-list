require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Deleting existing movies..."
Movie.delete_all

puts "Creating new movies..."

url = "https://tmdb.lewagon.com/movie/top_rated"
films_serialized = URI.open(url).read
films = JSON.parse(films_serialized)
films["results"].each do |result|
  Movie.create(title: result["original_title"], overview: result["overview"], poster_url: "https://image.tmdb.org/t/p/original/#{result["poster_path"]}", rating: result["vote_average"])
end

puts "Done!"
