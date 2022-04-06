//
//  LoginPageModel.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 26/02/2022.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class LoginPageModel: ObservableObject {
  
    //MARK: Login Properties (attributes)
    @Published var login:String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var Error:Bool = false
    @Published var justLogOff = false
    
    @AppStorage("log_status") var log_status: Bool = false
    @AppStorage("logged_user") var logged_user:String?
    
    //MARK: create Login Function
    func Logoff(){
        self.log_status = false
        self.logged_user = nil
    }
    func Login(){
        let parameters : [String: AnyHashable] = [
            "login": login,
            "password": password,
        ]
        let group: DispatchGroup = DispatchGroup()
        var message: Data??
        group.enter()
                DispatchQueue.main.async {
                    AF.request("http://127.0.0.1:8000/api/auth", method: .post, parameters: parameters, headers: nil).response { response in
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
                    if data["code"] == 200 {
                        self.log_status = true
                        self.logged_user = self.login
                        self.justLogOff = true
                        self.login = ""
                        self.password = ""
                    }else{
                        self.Error = true
                    }
                }
            }
        }
    }
}
