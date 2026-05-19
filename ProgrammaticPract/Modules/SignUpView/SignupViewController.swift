import UIKit
import Foundation

class SignUpScreen: UIViewController {
    
    
    
    var welcomeLabel = UILabel()
    var createAccountLabel = UILabel()
    var tNCLabel = UILabel()
    var loginLabel = UILabel()
    
    var signUpMainBtn = UIButton()
    
    var formStack = UIStackView()
    
    var usernameField = generateFormField(icon: "person.fill", text: "Username")
    var emailField = generateFormField(icon: "envelope.fill", text: "Email")
    var pswdField = generateFormField(icon: "key.fill", text: "Password")
    var confirmPswdField = generateFormField(icon: "key.circle.fill", text: "Confirm Password")
    
    
    private let signUpViewModel = SignUpViewModel()
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .coolPurple
        
        configWelcomeLabel()
        
        configCreateAccountLabel()
        
        configFormStack()
        
        configTnCLabel()
        
        configLoginLabel()
        
        configSignUpMainBtn()
        
    }
    
    static func generateFormField(icon: String, text: String, width w: Double = 20, height h: Double = 20) -> UIStackView {
        
        let icon = UIImageView(image: UIImage(systemName: icon))
        icon.tintColor = .white
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.widthAnchor.constraint(equalToConstant: w).isActive = true
        icon.heightAnchor.constraint(equalToConstant: h).isActive = true

        let textField = UITextField()
        textField.placeholder = text
        textField.textColor = .white
        textField.backgroundColor = .coolLightPurple
//        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textField.font = .systemFont(ofSize: 12)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
                
        let fieldRow = UIStackView()
        fieldRow.axis = .horizontal
        fieldRow.spacing = 10
        
        fieldRow.addArrangedSubview(icon)
        fieldRow.addArrangedSubview(textField)
        
        return fieldRow
    }
    
    func configFormStack(){
        view.addSubview(formStack)
        
        formStack.axis = .vertical
        
        formStack.spacing = 10
        
        
        formStack.addArrangedSubview(usernameField)
        formStack.addArrangedSubview(emailField)
        formStack.addArrangedSubview(pswdField)
        formStack.addArrangedSubview(confirmPswdField)
        
        
        formStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            formStack.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 40),
            formStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            formStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
    func configLoginLabel(){
        
        view.addSubview(loginLabel);
        
        loginLabel.text = "Already have an account? Login"
        loginLabel.textColor = .white
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.font = .systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
        
        
    }
    
    
    func configSignUpMainBtn(){
        
        view.addSubview(signUpMainBtn)
        
        signUpMainBtn.configuration = .filled()
        signUpMainBtn.configuration?.title = "Sign Up".uppercased()
        signUpMainBtn.configuration?.baseBackgroundColor = .systemCyan
        signUpMainBtn.configuration?.baseForegroundColor = .white
        
        signUpMainBtn.translatesAutoresizingMaskIntoConstraints = false
        
        signUpMainBtn.addTarget(self, action: #selector(signUpBtnTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signUpMainBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpMainBtn.bottomAnchor.constraint(equalTo: loginLabel.topAnchor, constant: -20),
            signUpMainBtn.widthAnchor.constraint(equalToConstant: 260),
        ])
        
    }
    
    @objc func signUpBtnTapped(){
        let username = (self.usernameField.arrangedSubviews[1] as? UITextField)?.text ?? ""
        let email = (self.emailField.arrangedSubviews[1] as? UITextField)?.text ?? ""
        let pswd = (self.pswdField.arrangedSubviews[1] as? UITextField)?.text ?? ""
        let cfmPswd = (self.confirmPswdField.arrangedSubviews[1] as? UITextField)?.text ?? ""
        
        signUpViewModel.signUpAction(username, email, pswd, cfmPswd, completionHandler: { [weak self] in
            self?.navigationController?.pushViewController(LoginViewController(), animated: true)
        })
    }
    
    
    func configTnCLabel(){
        
        view.addSubview(tNCLabel)
        
        tNCLabel.text = "By registering, you are agreeing with our terms and conditions"
        
        tNCLabel.textColor = .white
        
        tNCLabel.font = .systemFont(ofSize: 12)
        
        tNCLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tNCLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tNCLabel.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 20)
        ])
    }
    
    func configCreateAccountLabel(){
        view.addSubview(createAccountLabel)
        
        createAccountLabel.text = "Create Your Account"
        createAccountLabel.textColor = .white
        createAccountLabel.font = .systemFont(ofSize: 15)
        
        createAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func configWelcomeLabel(){
        
        view.addSubview(welcomeLabel)
            
        welcomeLabel.text = "Welcome"
        welcomeLabel.textColor = .white
        welcomeLabel.font = .systemFont(ofSize: 55)
    
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        ])
        
    }
    
    
    
    
    
    
}
