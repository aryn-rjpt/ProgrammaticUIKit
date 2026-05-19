//
//  SignUpViewModel.swift
//  ProgrammaticPract
//
//  Created by Unthinkable-Mac on 30/04/26.
//

import Foundation
import Alamofire

class SignUpViewModel {
    
    func signUpAction(_ username: String, _ email: String, _ pswd: String, _ cfmPswd: String, completionHandler: @escaping () -> Void ){
        let parameters = [
            "firstName": username,
            "lastName": email,
            "password": pswd,
            "confirm_password": cfmPswd
        ]
        
        AF.request("https://dummyjson.com/users/add", method: .post, parameters: parameters).responseData { response in
            
//            debugPrint(response)
            if response.response?.statusCode == 201 {
                debugPrint("User Created Successfully!")
                completionHandler()
            }
            
            

            
            
        }
    }
}
