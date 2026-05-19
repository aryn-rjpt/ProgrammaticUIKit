import Foundation

class MovieDetailsViewModel {

    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDesc: String
    var movieId: Int
    
     

    init(movie: Movie){
        self.movie = movie
        self.movieId =  movie.id ?? -1
        self.movieTitle = movie.title ?? ""
        self.movieDesc = movie.overview ?? ""
        self.movieImage = URL(string: NetworkConstants.shared.imageServerAddress + (movie.backdropPath ?? ""))
        
    }
}
