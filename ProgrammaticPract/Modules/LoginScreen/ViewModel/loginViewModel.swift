import Alamofire
import Foundation

class LoginViewModel {
    
    func login(_ username: String?, _ password: String?, completionHandler: @escaping () -> Void){
        
        let parameters = [
            "username": username,
            "password": password
        ]
        
        AF.request("https://dummyjson.com/user/login", method: .post, parameters: parameters).responseData { response in
            if response.response?.statusCode == 200 {
                completionHandler()
            }
        }
    }
}
