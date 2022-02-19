# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"
List.destroy_all

Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)


pictures = ["https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSC5_cQSmiJt3g3UC4uT2TU7ftxaA5K6yRxVG2yDqR59_r3sllx",
            "https://s2.dmcdn.net/v/Sk20H1W4zFIwwiJ2k/x1080",
            "https://media.gqmagazine.fr/photos/602a685fa7e774b0f42a1fc0/master/w_3000,h_2032,c_limit/MSDTITA_FE057.jpg",
            "https://static.lpnt.fr/images/2019/01/16/17942477lpw-17942549-article-jpg_5886015_660x287.jpg",
            "https://pictures.abebooks.com/isbn/9781844036738-fr.jpg",
            "https://i.ytimg.com/vi/zOucbvKHPeQ/maxresdefault.jpg",
            "https://media3.woopic.com/api/v1/images/174%2Faudiovisual%2Fmovie%2F4d4%2F01d%2F0fe3adacab77ce5e1531c62aa6%2Fredeeming-love%7Cmovies-282385-21864479.jpg?facedetect=1&quality=85",
            "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/716riayrvwl-ac-sl1500-1595956613.jpg?crop=1xw:0.948xh;center,top&resize=480:*"
          ]

@comedy = List.create(name: "Comedy", photo: pictures[0])
@action = List.create(name: "Action", photo: pictures[1])
@drama = List.create(name: "Drama", photo: pictures[2])
@fantasy = List.create(name: "Fantasy", photo: pictures[3])
@horror = List.create(name: "Horror", photo: pictures[4])
@mystery = List.create(name: "Mystery", photo: pictures[5])
@romance = List.create(name: "Romance", photo: pictures[6])
@thriller = List.create(name: "Thriller", photo: pictures[7])

url = "http://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)

movie["results"].each do |mov|
  title = mov['title']
  vote = mov['vote_average']
  overview = mov['overview']
  poster_url = "https://image.tmdb.org/t/p/w500#{mov['poster_path']}"
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: vote)
end
