//
//  RegisterPage.swift
//  tap&go (iOS)
//
//  Created by Racha Hamia  on 28/02/2022.
//

import SwiftUI

struct RegisterPage: View {
    @State private var showingAlert = false
    var body: some View {
        VStack{
            RegisterTitle().frame(height: getScreenSize().height/3.5)
            RegisterForm()
            //
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("5").resizable().scaledToFill().ignoresSafeArea()
            )
    }
}
struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RegisterPage()
        }
    }
}
