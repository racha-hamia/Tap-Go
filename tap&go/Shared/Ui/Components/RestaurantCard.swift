//
//  RestaurantCard.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 05/03/2022.
//

import SwiftUI

struct RestaurantCard: View {
    @State var restaurantName:String
    @State var restaurantGrade:String
    @State var restaurantLocalization:String
    var body: some View {
        VStack(spacing:10){
            Image("R").resizable().aspectRatio(contentMode: .fit).frame(width: getScreenSize().width / 2.5 , height: getScreenSize().width / 2.5)
                .offset(y: -80)
                .padding(.bottom, -80)
            Text(restaurantName).font(.system(size: 18, weight: .semibold, design: .rounded)).padding(.top).foregroundColor(Color.black)
            Text(restaurantLocalization).font(.system(size: 14,design: .rounded)).foregroundColor(Color.gray)
            Text("Grade : \(restaurantGrade)").font(.system(size: 12, weight: .bold, design: .rounded)).padding(.top,5).foregroundColor(Color.black).padding(.bottom, 22)
        }.padding(.horizontal,20)
            .background(
            Color.white
                .cornerRadius(25)).shadow(color: .brown, radius: 5.0, x: 3.0, y: 3.0).padding(.top, 80)
                
    }
}

struct RestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCard(restaurantName: "String",restaurantGrade: "String",restaurantLocalization: "String")
    }
}
