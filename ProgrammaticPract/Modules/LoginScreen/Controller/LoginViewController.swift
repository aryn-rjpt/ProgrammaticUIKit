
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() { // remove this
        super.viewDidLoad()
        
        signInButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
    }
    
    @objc func loginBtnTapped() {
        loginViewModel.login(usernameField.text, passwordField.text, completionHandler: { [weak self] in
            self?.navigationController?.pushViewController(MovieViewController(), animated: true)
        })
    }
    
    



}
