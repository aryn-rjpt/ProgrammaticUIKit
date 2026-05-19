import UIKit

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func setupMovieTableView() {
        
        movieTableView.backgroundColor = .clear
        
        // set delegates
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        // set constraints
        movieTableView.pin(to: view)

        // register cells
        movieTableView.register(MovieCell.self, forCellReuseIdentifier: "movieCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieCell else {return UITableViewCell()}
        
        let movie = self.moviesList[indexPath.row]
        
        cell.set(movie: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(MovieDetailsViewController(viewModel: MovieDetailsViewModel(movie: self.moviesList[indexPath.row])), animated: true)
    }
    
    func bindMovieViewModel(){
        
        movieViewModel.isLoading.bind { [weak self] isLoading in
            
            guard let self = self, let isLoading = isLoading else {return}
            
            DispatchQueue.main.async {
                if isLoading {
                    self.loader.startAnimating()
                }
                else{
                    self.loader.stopAnimating()
                }
            }
            
        }
        
        movieViewModel.movies.bind { [weak self] movies in
            
            guard let self = self, let movies = movies else {return}
            
            self.moviesList = movies
            
            // Reload the table view
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        }
    }
    
    
}
