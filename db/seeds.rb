# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
movies = user['results']
movies.each do |movie|
  Movie.create(title: movie['original_title'], overview: movie['overview'],
               poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}", rating: movie['vote_average'])
end

Movie.create(title: 'Taken', overview: "Que peut-on imaginer de pire pour un père que d'assister
            impuissant à l'enlèvement de sa fille via un téléphone portable ? C'est le cauchemar
            vécu par Bryan, ancien agent des services secrets américains, qui n'a que quelques
            heures pour arracher Kim des mains d'un redoutable gang spécialisé dans la traite
            des femmes. Premier problème à résoudre : il est à Los Angeles, elle vient de se
            faire enlever à Paris.", poster_url: 'https://image.tmdb.org/t/p/w500/t/p/w300_and_h450_bestv2/4h9b8E2C9FdIVKbQRDMwZzpSIjL.jpg', rating: '7.4')
