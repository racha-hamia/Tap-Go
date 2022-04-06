//
//  RestaurantDetailCard.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 06/03/2022.
//

import SwiftUI

struct RestaurantDetailCard: View {
    @State var name:String
    @State var description:String
    @State var localization:String
    @State var phone_number:String
    @State var website:String
    @State var hours:String
    @State var grade:String
    @State var id:Int
    @State var menus = [Menu]()
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            Image("R").resizable().aspectRatio(contentMode: .fit).frame(width: getScreenSize().width / 2.5 , height: getScreenSize().width / 2.5)

            VStack(spacing:10) {
            Text(name).font(.system(size: 18, weight: .semibold, design: .rounded)).padding(.top).foregroundColor(Color.black)
            Text(localization).font(.system(size: 14,design: .rounded)).foregroundColor(Color.gray)
            Text("Grade : \(grade)").font(.system(size: 12, weight: .bold, design: .rounded)).padding(.top,5).foregroundColor(Color.black)
            Text("Description : ")
            Text(description).frame(width: (getScreenSize().width / 3) * 2).font(.system(size: 14,design: .rounded)).foregroundColor(Color.gray)
            }.padding()
            VStack(spacing:10) {
                Text("Localization : ")
                Text(localization).frame(width: (getScreenSize().width / 3) * 2).font(.system(size: 14,design: .rounded)).foregroundColor(Color.gray)
                Text("Phone number : ")
                Text(phone_number).frame(width: (getScreenSize().width / 3) * 2).font(.system(size: 14,design: .rounded)).foregroundColor(Color.gray)
                Text("WebSite : ")
                Text(website).frame(width: (getScreenSize().width / 3) * 2).font(.system(size: 14,design: .rounded)).foregroundColor(Color.gray)
            }.padding().onAppear {
               
                MenuPageModel().loadData(id: self.id) { menus in
                    self.menus = menus
                }
            }
            VStack{
                ForEach(menus, id: \.self){
                        menu in MenusCard(name: menu.name , description: menu.name , price: String(menu.price))
                }
            }.padding(.bottom ,150)
            
        }.frame(width : getScreenSize().width , height: getScreenSize().height)
        .padding(.horizontal,20)
            .background(
            Color.white
                .cornerRadius(25)).shadow(color: .brown, radius: 5.0, x: 3.0, y: 3.0).padding(.top, 80)
                
    }
}

struct RestaurantDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailCard(name: "le petit gourmand", description: "restaurant de type faste food italien vente de pizza pate et lazagna", localization: "2 boulevard test paris 75001", phone_number: "0130355565", website: "WWW.LEGOUMAND.COM", hours: "9H-13H", grade: "10.0",id:0)
    }
}
