import UIKit

class MainViewController: UIViewController {

    private lazy var tableViewBtn = makeBtn(
        title: "Table View",
        action: #selector(goToTableView)
    )

    private lazy var StackViewBtn = makeBtn(
        title: "Stack View",
        action: #selector(goToStackView)
    )

    private lazy var SignUpBtn = makeBtn(
        title: "Sign Up",
        action: #selector(goToSignUp)
    )

    private lazy var loginBtn = makeBtn(
        title: "Login",
        action: #selector(goToLogin)
    )

    private lazy var movieBtn = makeBtn(
        title: "Movies MVVM",
        action: #selector(goToMovies)
    )

    private lazy var scrollViewBtn = makeBtn(
        title: "Scroll View",
        action: #selector(goToScrollView)
    )

    private lazy var storyBoardPracBtn = makeBtn(
        title: "Story Prac",
        action: #selector(goToStoryPracScreen)
    )
    
    private lazy var bezierBtn = makeBtn(
        title: "Bezier Btn",
        action: #selector(goToBezier)
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow

        title = "Programmatic UIKit"

        view.addSubview(tableViewBtn)
        view.addSubview(StackViewBtn)
        view.addSubview(SignUpBtn)
        view.addSubview(loginBtn)
        view.addSubview(movieBtn)
        view.addSubview(scrollViewBtn)
        view.addSubview(storyBoardPracBtn)
        view.addSubview(bezierBtn)

        // Common constraints
        tableViewBtn.translatesAutoresizingMaskIntoConstraints = false
        StackViewBtn.translatesAutoresizingMaskIntoConstraints = false
        SignUpBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        movieBtn.translatesAutoresizingMaskIntoConstraints = false
        scrollViewBtn.translatesAutoresizingMaskIntoConstraints = false
        storyBoardPracBtn.translatesAutoresizingMaskIntoConstraints = false
        bezierBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableViewBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableViewBtn.widthAnchor.constraint(equalToConstant: 200),
            StackViewBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            StackViewBtn.widthAnchor.constraint(equalToConstant: 200),
            SignUpBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SignUpBtn.widthAnchor.constraint(equalToConstant: 200),
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.widthAnchor.constraint(equalToConstant: 200),
            movieBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieBtn.widthAnchor.constraint(equalToConstant: 200),
            scrollViewBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollViewBtn.widthAnchor.constraint(equalToConstant: 200),
            storyBoardPracBtn.centerXAnchor.constraint( equalTo: view.centerXAnchor ),
            storyBoardPracBtn.widthAnchor.constraint(equalToConstant: 200),
            bezierBtn.centerXAnchor.constraint( equalTo: view.centerXAnchor ),
            bezierBtn.widthAnchor.constraint(equalToConstant: 200),
        ])

        // Positioning
        NSLayoutConstraint.activate([
            tableViewBtn.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            StackViewBtn.topAnchor.constraint(
                equalTo: tableViewBtn.bottomAnchor,
                constant: 20
            ),
            SignUpBtn.topAnchor.constraint(
                equalTo: StackViewBtn.bottomAnchor,
                constant: 20
            ),
            loginBtn.topAnchor.constraint(
                equalTo: SignUpBtn.bottomAnchor,
                constant: 20
            ),
            movieBtn.topAnchor.constraint(
                equalTo: loginBtn.bottomAnchor,
                constant: 20
            ),
            scrollViewBtn.topAnchor.constraint(
                equalTo: movieBtn.bottomAnchor,
                constant: 20
            ),
            storyBoardPracBtn.topAnchor.constraint(
                equalTo: scrollViewBtn.bottomAnchor,
                constant: 20
            ),
            bezierBtn.topAnchor.constraint(
                equalTo: storyBoardPracBtn.bottomAnchor,
                constant: 20
            ),
        ])

    }

    @objc private func goToTableView() {
        navigationController?.pushViewController(
            TableViewController(),
            animated: true
        )
    }

    @objc private func goToStackView() {
        navigationController?.pushViewController(StackView(), animated: true)
    }

    @objc private func goToSignUp() {
        navigationController?.pushViewController(SignUpScreen(), animated: true)
    }

    @objc private func goToLogin() {
        navigationController?.pushViewController(
            LoginViewController(),
            animated: true
        )
    }

    @objc private func goToMovies() {
        navigationController?.pushViewController(
            MovieViewController(),
            animated: true
        )
    }

    @objc private func goToScrollView() {
        navigationController?.pushViewController(
            ScrollViewController(),
            animated: true
        )
    }

    @objc private func goToStoryPracScreen() {
        navigationController?.pushViewController(StoryPracVC(), animated: true)
    }
    
    @objc private func goToBezier() {
        navigationController?.pushViewController(BezierVC(), animated: true)
    }

    private func makeBtn(title: String?, action: Selector) -> UIButton {

        let btn = UIButton()

        btn.configuration = .filled()

        btn.configuration?.title = title ?? "MyButton"

        btn.addTarget(self, action: action, for: .touchUpInside)

        return btn

    }
}
