
import UIKit
import SDWebImage

class MovieCell: UITableViewCell {
    
    private var title = UILabel()
    private var date = UILabel()
    private var popularity = UILabel()
    private var movieImage = UIImageView()
    private var detailsStack = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(movieImage)
        addSubview(detailsStack)
        
        configImage()
        configDetailsStack()
        configMovieTitle()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    
    func set(movie: Movie){
        self.title.text = movie.title ?? ""
        self.date.text = movie.releaseDate ?? ""
        self.popularity.text = String(movie.popularity ?? 0)
        
        self.movieImage.sd_setImage(with: URL(string: NetworkConstants.shared.imageServerAddress + (movie.posterPath ?? "")))
        
//        if let url = URL(string: NetworkConstants.shared.imageServerAddress + (movie.posterPath ?? "")) {
//            URLSession.shared.dataTask(with: url) { [weak self] data, urlResponse, error in
//                guard let data = data, error == nil else {return}
//                
//                DispatchQueue.main.async {
//                    self?.movieImage.image = UIImage(data: data)
//                }
//            }.resume()
//        }
        
    }
    
    private func configImage(){
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            movieImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            movieImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            movieImage.widthAnchor.constraint(equalToConstant: 100),
            movieImage.heightAnchor.constraint(equalToConstant: 100),
        ])
    }

    private func configDetailsStack(){
        
        detailsStack.axis = .vertical
        detailsStack.distribution = .fill
        detailsStack.addArrangedSubview(title)
        detailsStack.addArrangedSubview(UIView())
        detailsStack.addArrangedSubview(date)
        detailsStack.addArrangedSubview(popularity)

        detailsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsStack.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: 10),
            detailsStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            detailsStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            detailsStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
        
    }
    
    private func configMovieTitle(){
        title.font = .boldSystemFont(ofSize: 20)
    }
    
    
    
    
}
