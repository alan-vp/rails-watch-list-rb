require 'json'
require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies = URI.open(url).read
response = JSON.parse(movies)

top_10_movies = response['results'].first(10)

top_10_movies.each do |movie|
  movie_hash = { title: movie['title'], overview: movie['overview'], poster_url: "https://image.tmdb.org/t/p/w200#{movie['poster_path']}", rating: movie['vote_average'] }
  Movie.create(movie_hash)
end
