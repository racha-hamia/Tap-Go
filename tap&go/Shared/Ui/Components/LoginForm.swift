//
//  LoginForm.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 04/03/2022.
//

import SwiftUI

struct LoginForm: View {
    @AppStorage("log_status") var log_status: Bool = false
    @StateObject var loginData : LoginPageModel = LoginPageModel()
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            //Login Form
            VStack(spacing:15){
                //add input field
                InputFieldCustom(icon: "person", title: "Login", hint: "Tap your login here",fontColor: false , value: $loginData.login, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "lock", title: "Password", hint: "Tap your password here ",fontColor: false ,value: $loginData.password, showPassword: $loginData.showPassword).padding(.top,30)
                Button("Tap to Login"){ loginData.Login() }.padding(.top,30)
                NavigationLink(isActive: $log_status) { RestaurantListPage() } label: { EmptyView() }
            }.padding(30).frame(maxWidth: .infinity,alignment : .leading).foregroundColor(Color.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.brown
                    .clipShape(RadiusCorners(corners: [.topLeft,.topRight], radius: 25)).ignoresSafeArea()
            ).alert("Error something is wrong about your login or your password", isPresented: $loginData.Error) {
                Button("try again", role: .cancel) { loginData.Error = false }
            }
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
