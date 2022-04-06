//
//  RestaurantPage.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 06/03/2022.
//

import SwiftUI

struct RestaurantPage: View {
    @State var restaurants = [Restaurant]()
    
    var body: some View {
        ForEach(restaurants, id: \.self){
            restau in RestaurantDetailCard(name: restau.name, description: restau.description, localization: restau.localization, phone_number: restau.phone_number, website: restau.website, hours: restau.hours, grade: String(restau.grade), id: restau.id)
        }
    }
}

struct RestaurantPage_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantPage( restaurants: [] )
    }
}
