//
//  RegisterPageModel.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 01/03/2022.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class RegisterPageModel: ObservableObject {
    //MARK: Register Properties (attributes)
    @Published var login:String = ""
    @Published var password:String = ""
    @Published var email:String = ""
    @Published var name:String = ""
    @Published var firstname:String = ""
    @Published var age:String = ""
    @Published var showPassword: Bool = false
    @Published var Error:Bool = false
    
    @AppStorage("log_status") var log_status: Bool = false
    @AppStorage("logged_user") var logged_user:String?
    // Register function
    func Register(){
    let parameters : [String: AnyHashable] = [
        "login": login,
        "password": password,
        "email": email,
        "name": name,
        "firstname": firstname,
        "age": age,
    ]
        let group: DispatchGroup = DispatchGroup()
        var message: Data??
        group.enter()
        DispatchQueue.main.async {
            AF.request("http://127.0.0.1:8000/api/register", method: .post, parameters: parameters, headers: nil)
                .response { response in
                            switch response.result {
                                case .success:
                                    message = response.value
                                case let .failure(error):
                                    print("Alamofire error: \(error)")
                            }
                        group.leave()
                    }
                }
        group.notify(queue: .main) {
            if message != nil {
                if let data = try? JSON(data: message!!){
                    if data["code"] == 201 {
                        print("this user is ok")
                        self.log_status = true
                        self.logged_user = self.login
                        self.login = ""
                        self.password = ""
                        self.email = ""
                        self.name = ""
                        self.firstname = ""
                        self.age = ""
                        
                    }else{
                        self.Error = true
                    }
                }
            }
        }
    }
}
