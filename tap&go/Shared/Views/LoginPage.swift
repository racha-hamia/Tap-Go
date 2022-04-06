//
//  LoginPage.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 26/02/2022.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData : LoginPageModel = LoginPageModel()
    @State var goToOnBoardingPage: Bool = false
    @State var goToRestaurantListPage: Bool = false
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            VStack{
                Text("Welcome").font(.system(size: 50, weight: .bold, design: .default))
                    .foregroundColor(.white).frame(maxWidth:.infinity,alignment: .trailing)
                
                Text("Back to ").font(.system(size: 50, weight: .bold, design: .default))
                    .foregroundColor(.white).frame(maxWidth:.infinity,alignment: .leading)
                
                Text("Tap & Go").font(.system(size: 50, weight: .bold, design: .default))
                    .foregroundColor(.white).frame(maxWidth:.infinity,alignment: .trailing)
                
            }
            .frame(height: getRect().height/3.5)
            ScrollView(.vertical,showsIndicators: false){
                
                //Login Form
                VStack(spacing:15){
                    
                    //add input field
                    
                    InputField(icon: "person", title: "Login", hint: "Tap your login here", value: $loginData.login, showPassword: .constant(false)).padding(.top,30)
                    
                    InputField(icon: "lock", title: "Password", hint: "Tap your password here ", value: $loginData.password, showPassword: $loginData.showPassword).padding(.top,30)
                    
                    Button {
                        withAnimation{
                            loginData.Login()
                            if SessionModel.shared.isAuthenticating == true {
                                SessionModel.shared.loggedInUser = loginData.login
                                goToRestaurantListPage = true
                            }else{
                                showingAlert = true
                            }
                            
                        }
                        
                    } label: {
                        Text("Tap to Login").padding(.top,30)
                        
                    }
                    Button {
                        withAnimation{
                            goToOnBoardingPage = true
                        }
                    } label: {
                        Text("Tap to go Back").padding(.top,30)
                        
                    }
                    
                }.padding(30).frame(maxWidth: .infinity,alignment : .leading).foregroundColor(Color.white)
                
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.brown
                    .clipShape(RadiusCorners(corners: [.topLeft,.topRight], radius: 25)).ignoresSafeArea()
            )
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            
            Image("5").resizable().scaledToFill().ignoresSafeArea()
        ).overlay(Group{
            if goToOnBoardingPage{
                OnBoardingPage()
                    .transition(.move(edge: .top))
            }
            
            if goToRestaurantListPage{
                RestaurantListPage()
                    .transition(.move(edge: .top))
            }
        }).alert("Error something is wrong about your login or your password", isPresented: $showingAlert) {
            Button("try again", role: .cancel) { showingAlert = false }
        }
        
    }
    
    //create a component
    @ViewBuilder
    func InputField(icon : String, title: String,hint: String,value:Binding<String>,showPassword:Binding<Bool> )->some View{
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(title)
            } icon:{
                Image(systemName: icon)
            }.foregroundColor(Color.white.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text:value).padding()
                    .foregroundColor(.white)
                    .padding(.top,2)
            }
            else {
                TextField(hint, text:value).padding()
                    .foregroundColor(.white)
                    .padding(.top,2)
            }
            Divider()
                .background(Color.black)
        }
        //create the toggle to unhide the password
        .overlay(Group{
            if title.contains("Password"){
                
                Button(
                    action :{
                        showPassword.wrappedValue.toggle()
                    },
                    label : {
                        Text(showPassword.wrappedValue ? "Tap to hide" : "Tap to unhide")
                            .foregroundColor(Color.white)
                    }).offset(y:8)
            }
        },alignment: .trailing)
           
            
            
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
