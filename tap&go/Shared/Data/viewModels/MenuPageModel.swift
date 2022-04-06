//
//  MenuPageModel.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 06/03/2022.
//

import Foundation

class MenuPageModel: ObservableObject {
    @Published var restaurants = [Menu]()
    @Published var Error:Bool = false
    
    func loadData(id:Int ,completion:@escaping ([Menu]) -> ()){
        print(id)
        guard let url = URL(string: "http://127.0.0.1:8000/api/restaurant/\(id)/menus") else {
            print ("invalid url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let menus = try! JSONDecoder().decode([Menu].self, from: data!)
            print(menus)
            DispatchQueue.main.async {
                completion(menus)
            }
        }.resume()
        }
}
