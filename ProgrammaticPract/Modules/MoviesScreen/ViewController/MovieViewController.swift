
import UIKit



class MovieViewController: UIViewController {

    lazy var movieTableView = {
        return UITableView()
    }()
    
    var movieViewModel = MovieDataViewModel()
    
    var loader = UIActivityIndicatorView(style: .large)
    
    var moviesList: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad() 
        
        view.backgroundColor = .yellow
        
        title = "Movies"

        view.addSubview(movieTableView)
        
        setupMovieTableView()
        
        loader.center = view.center
        view.addSubview(loader)
        
        bindMovieViewModel()
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        movieViewModel.getMovieData()
    }
    
    

    
    


}


