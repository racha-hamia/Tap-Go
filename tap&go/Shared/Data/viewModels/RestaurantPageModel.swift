//
//  RestaurantPageModel.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 05/03/2022.
//

import Foundation
import Alamofire
import SwiftyJSON




class RestaurantPageModel: ObservableObject {
    //MARK: Login Properties (attributes)
    @Published var restaurants = [Restaurant]()
    @Published var name:String = ""
    @Published var description:String = ""
    @Published var localization:String = ""
    @Published var phone_number:String = ""
    @Published var website:String = ""
    @Published var hours:String = ""
    
    @Published var Error:Bool = false
    @Published var isCreated:Bool = false
    
    func loadData(completion:@escaping ([Restaurant]) -> ()){
        guard let url = URL(string: "http://127.0.0.1:8000/api/restaurants") else {
            print ("invalid url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let restaurants = try! JSONDecoder().decode([Restaurant].self, from: data!)
            DispatchQueue.main.async {
                completion(restaurants)
            }
        }.resume()
        }
    
    func deleteRestaurant(id:Int){
            let group: DispatchGroup = DispatchGroup()
            var message: Data??
            group.enter()
            DispatchQueue.main.async {
                AF.request("http://127.0.0.1:8000/api/restaurant", method: .delete).response { response in
                    switch response.result {
                        case .success:
                        message = response.value
                        case let .failure(error):
                        print("Alamofire error: \(error)")
                    }
                    group.leave()
                }
                group.notify(queue: .main) {
                    if message != nil {
                        if let data = try? JSON(data: message!!){
                            if data["code"] == 201 {
                                self.isCreated = true
                            }else{
                                self.Error = true
                            }
                        }
                    }
                }
            }
        }
    
    func createRestaurant() {
        let parameters : [String: AnyHashable] = [
            "name": name,
            "description": description,
            "grade": 0.0,
            "localization": localization,
            "phone_number": phone_number,
            "website" : website,
            "hours": hours
        ]
        let group: DispatchGroup = DispatchGroup()
        var message: Data??
        group.enter()
        DispatchQueue.main.async {
            AF.request("http://127.0.0.1:8000/api/restaurant", method: .post, parameters: parameters, headers: nil).response { response in
                switch response.result {
                    case .success:
                    message = response.value
                    case let .failure(error):
                    print("Alamofire error: \(error)")
                }
                group.leave()
            }
            group.notify(queue: .main) {
                if message != nil {
                    if let data = try? JSON(data: message!!){
                        if data["code"] == 201 {
                            self.name = ""
                            self.description = ""
                            self.localization = ""
                            self.phone_number = ""
                            self.website = ""
                            self.hours = ""
                            self.isCreated = true
                        }else{
                            self.Error = true
                        }
                    }
                }
            }
        }
        
        
    }
    
}
