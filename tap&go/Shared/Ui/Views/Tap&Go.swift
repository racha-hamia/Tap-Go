//
//  ContentView.swift
//  Shared
//
//  Created by Jessy Habert on 26/02/2022.
//

import SwiftUI

struct TapAndGo: View {
    @AppStorage("log_status") var log_status: Bool = false
    @AppStorage("logged_user") var logged_user:String?
    
    var body: some View {
        NavigationView{
            if log_status {
                RestaurantListPage()
            }else{
                OnBoardingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TapAndGo()
    }
}
