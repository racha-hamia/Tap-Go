//
//  CreateRestaurant.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 05/03/2022.
//

import SwiftUI

struct CreateRestaurant: View {
    @StateObject var restaurantData : RestaurantPageModel = RestaurantPageModel()
    var body: some View {
        ScrollView(.vertical,showsIndicators: true){
            Text("Add Restaurant").font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(.brown).frame(maxWidth:.infinity,alignment: .center).shadow(color: .black, radius: 0.5, x: 2.0, y: 2.0)
            VStack(spacing:15){
                //add input field
                InputFieldCustom(icon: "", title: "Name", hint: "Tap restaurant name here",fontColor: true ,value: $restaurantData.name, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "", title: "Description", hint: "Tap description here",fontColor: true ,value: $restaurantData.description, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "", title: "Localization", hint: "Tap restaurant localization here",fontColor: true ,value: $restaurantData.localization, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "", title: "Phone_number", hint: "Tap restaurant phone_number here",fontColor: true ,value: $restaurantData.phone_number, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "", title: "Website", hint: "Tap restaurant website here",fontColor: true ,value: $restaurantData.website, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "", title: "Hours", hint: "Tap restaurant hours here",fontColor: true ,value: $restaurantData.hours, showPassword: .constant(false)).padding(.top,30)
                Button("Tap to Create") { restaurantData.createRestaurant()
                }.padding(.bottom, 30).padding(.top,30).foregroundColor(.brown).shadow(color: .black, radius: 0.25, x: 1.0, y: 1.0)
            }.padding(30).frame(maxWidth: .infinity,alignment : .leading).foregroundColor(Color.brown)
        }.alert("Error something is wrong about your request please check your fields", isPresented: $restaurantData.Error) {
            Button("try again", role: .cancel) { restaurantData.Error = false }
        }
    }
}

struct CreateRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CreateRestaurant()
        }
    }
}
