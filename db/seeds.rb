require 'open-uri'
require 'json'

url = "http://tmdb.lewagon.com/movie/top_rated"
uri_data = URI.open(url).read
data = JSON.parse(uri_data)

puts "creating movies..."

data["results"].each do |movie|
  new_movie = {
                title: movie['title'],
                overview: movie['overview'],
                poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
                rating: movie['vote_average']
              }
  Movie.create!(new_movie)
end

puts "seeding done!"
