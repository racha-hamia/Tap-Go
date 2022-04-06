//
//  MenusCard.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 06/03/2022.
//

import SwiftUI

struct MenusCard: View {
    @State var name:String
    @State var description:String
    @State var price:String
    var body: some View {
        VStack(spacing:10){
            Text(name)
            Text(description)
            Text("\(price) euros")
        }.frame(width : getScreenSize().width / 2 * 1.5, height:getScreenSize().height / 6)
            .padding(.horizontal,20)
                .background(
                Color.brown
                    .cornerRadius(25)).shadow(color: .brown, radius: 5.0, x: 3.0, y: 3.0).padding(.top, 5)
    }
}

struct MenusCard_Previews: PreviewProvider {
    static var previews: some View {
        MenusCard(name: "String", description: "String", price: "5.5 euros")
    }
}
