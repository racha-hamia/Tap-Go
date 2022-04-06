//
//  OnBoardingPage.swift
//  tap&go (iOS)
//
//  Created by Racha Hamia on 26/02/2022.
//
import SwiftUI
struct OnBoardingPage: View {
    var body: some View {
        VStack(){
            OnBoardingTitle()
            VStack{
                NavLButton(title: "Sign Up", color: true)
                NavLButton(title: "Log In", color: false)
                NavLContinueWithoutSignIn()
            }.frame(height: (getScreenSize().height/3)*2 , alignment: .bottom)
        }.onAppear(perform: {
            if LoginPageModel().justLogOff {
                LoginPageModel().justLogOff = false
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("5").resizable().scaledToFill().ignoresSafeArea())
    }
}
struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OnBoardingPage()
        }
    }
}
