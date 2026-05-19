
import UIKit

class StackView: UIViewController {
    
    var titleLabel = UILabel()
    
    var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        configStackTitle()
        configStackView()
        
    }
    
    func configStackView(){
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        stackView.axis          = .vertical
        stackView.distribution  = .fillEqually
        stackView.spacing       = 20
        
          NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        
        
        for i in 1...5{
            let btn = SurveyButton()
            btn.setTitle("\(i)", for: .normal)
            stackView.addArrangedSubview(btn)
        }
        
    }
    
    func configStackTitle(){
        view.addSubview(titleLabel)
        
        titleLabel.text                         = "Rate our supremacy!"
        titleLabel.numberOfLines                = 0
        titleLabel.backgroundColor              = .red
        titleLabel.textAlignment                = .center
        titleLabel.font                         = .boldSystemFont(ofSize: 20)
        titleLabel.adjustsFontSizeToFitWidth    = true
        titleLabel.textColor                    = .white
        titleLabel.layer.cornerRadius           = 10
        titleLabel.clipsToBounds                = true
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    

}
