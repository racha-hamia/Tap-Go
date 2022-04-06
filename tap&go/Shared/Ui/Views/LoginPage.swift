//
//  LoginPage.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 26/02/2022.
//

import SwiftUI
struct LoginPage: View {
    @StateObject var loginData : LoginPageModel = LoginPageModel()
    var body: some View {
        VStack{
            LoginPageTitle()
            LoginForm()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("5").resizable().scaledToFill().ignoresSafeArea()
        )
    }
}
struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
