//
//  RegisterForm.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 05/03/2022.
//

import SwiftUI

struct RegisterForm: View {
    @StateObject var RegisterData : RegisterPageModel = RegisterPageModel()
    @AppStorage("log_status") var log_status: Bool = false
    var body: some View {
        ScrollView(.vertical,showsIndicators: true){
            VStack(spacing:15){
                //add input field
                InputFieldCustom(icon: "person", title: "Login", hint: "Tap your login here",fontColor: true ,value: $RegisterData.login, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "lock", title: "Password", hint: "Tap your login here",fontColor: true, value: $RegisterData.password, showPassword: $RegisterData.showPassword).padding(.top,30)
                InputFieldCustom(icon: "square.and.arrow.up", title: "Email", hint: "Tap your email here",fontColor: true, value: $RegisterData.email, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "textformat.abc", title: "Lastname", hint: "Tap your lastname here",fontColor: true, value: $RegisterData.name, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "textformat.abc", title: "Firstname", hint: "Tap your firstname here",fontColor: true,value: $RegisterData.firstname, showPassword: .constant(false)).padding(.top,30)
                InputFieldCustom(icon: "textformat.123", title: "Age", hint: "Tap your age here",fontColor: true, value: $RegisterData.age, showPassword: .constant(false)).padding(.top,30)
               //buton
                Button("Tap to Register") {
                    RegisterData.Register()
                }.padding(.bottom, 30).padding(.top,30).foregroundColor(.brown).shadow(color: .black, radius: 0.25, x: 1.0, y: 1.0)
                NavigationLink(isActive: $log_status) { RestaurantListPage() } label: { EmptyView() }
            }.padding(30).frame(maxWidth: .infinity,alignment : .leading).foregroundColor(Color.brown)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.init(red: 211, green: 211, blue: 211)
                    .clipShape(RadiusCorners(corners: [.topLeft,.topRight], radius: 25)).ignoresSafeArea()
            ).alert("Error something is wrong about your request please check your fields", isPresented: $RegisterData.Error) {
                Button("try again", role: .cancel) { RegisterData.Error = false }
            }
    }
}

struct RegisterForm_Previews: PreviewProvider {
    static var previews: some View {
        RegisterForm()
    }
}
