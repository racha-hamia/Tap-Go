//
//  LoginPageTitle.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 04/03/2022.
//

import SwiftUI

struct LoginPageTitle: View {
    var body: some View {
        VStack{
            Text("Welcome").font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(.white).frame(maxWidth:.infinity,alignment: .trailing).shadow(color: .black, radius: 1.0, x: 1.0, y: 1.0)
            
            Text("Back to ").font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(.white).frame(maxWidth:.infinity,alignment: .leading).shadow(color: .black, radius: 1.0, x: 1.0, y: 1.0)
            
            Text("Tap & Go").font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(.white).frame(maxWidth:.infinity,alignment: .trailing).shadow(color: .black, radius: 1.0, x: 1.0, y: 1.0)
            
        }
        .frame(height: getScreenSize().height/3.5)
    }
}

struct LoginPageTitle_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageTitle()
    }
}
