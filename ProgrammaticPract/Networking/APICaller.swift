import Foundation


enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMoviesResponseModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstants.shared.serverAddress + "trending/movie/day"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue("Bearer ", forHTTPHeaderField: "Authorization")
        #warning("Add a bearer token here")
        
        URLSession.shared.dataTask(with: request) { dataResponse, urlRespone, error in
            if let error = error {
                print("Network Error: \(error.localizedDescription)")
                completionHandler(.failure(.urlError))
                return
            }
            
            guard let data = dataResponse else {
                print("No data received")
                completionHandler(.failure(.canNotParseData))
                return
            }
            
            do {
                let resultData = try JSONDecoder().decode(TrendingMoviesResponseModel.self, from: data)
                completionHandler(.success(resultData))
            } catch {
                print("Decoding Error: \(error)")
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
    
}
