import UIKit
import SDWebImage


class MovieDetailsViewController: UIViewController {


    @IBOutlet weak var movieDetailImg: UIImageView!
    
    @IBOutlet weak var movieDetailDesc: UILabel!
    @IBOutlet weak var movieDetailTitle: UILabel!
    
    
    var viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel){
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie Details"

        movieDetailTitle.text = viewModel.movieTitle
        movieDetailDesc.text = viewModel.movieDesc
        movieDetailImg.sd_setImage(with: viewModel.movieImage)
        
    }


}
