//
//  RestaurantListPage.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 28/02/2022.
//

import SwiftUI
struct RestaurantListPage: View {
    @State var restaurants = [Restaurant]()
    @StateObject var loginData : LoginPageModel = LoginPageModel()
    @AppStorage("log_status") var log_status: Bool = false
    @AppStorage("logged_user") var logged_user:String?
    var body: some View {
        VStack {
            SearchBar().onAppear {
            RestaurantPageModel().loadData { (restaurants) in
                self.restaurants = restaurants
            }
        }
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:25)
            {
                ForEach(restaurants, id: \.self){
                    restau in NavigationLink {
                        RestaurantPage(restaurants: [restau])
                    } label: {
                        RestaurantCard(restaurantName: restau.name , restaurantGrade: String(restau.grade) , restaurantLocalization: restau.localization)
                    }
                }
                
            }.padding(.bottom)
            
        }.frame(height : getScreenSize().height/3)
            VStack{
                if !log_status {
                    Text("Welcome to tap & go Please create an account for have full right").padding(50).frame(alignment: .center)
                }else {
                    Text("Welcome back \(logged_user!)")
                }
                
                NavigationLink { CreateRestaurant() } label: {
                    Text("Add a restaurant ").foregroundColor(Color.white)
                }.padding()
                
                NavigationLink(isActive: $loginData.justLogOff ) { OnBoardingPage()  } label: { EmptyView() }
                
                if log_status {
                    Button("Tap here to disconnect"){ LoginPageModel().Logoff() }.foregroundColor(Color.black)
                }

            }.frame(width : getScreenSize().width , height : getScreenSize().height/3) .background(
                Color.brown.cornerRadius(25)
            )
        }.background(Color.white)
        
    }
}
struct RestaurantListPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RestaurantListPage()
        }
    }
}
