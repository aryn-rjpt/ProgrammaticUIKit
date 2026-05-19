import Foundation


class MovieDataViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    
    var movies: Observable<[Movie]> = Observable([])
    
    func getMovieData(){
        
        guard ( isLoading.value == false ) else { return }
        
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in
            
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top trending count: \(data.results?.count ?? 0)")
                self?.movies.value = data.results ?? []

            case .failure(let error):
                print(error)
            }
        
            
        }
    }

}
