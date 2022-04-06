//
//  NavLContinueWithoutSignIn.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 04/03/2022.
//

import SwiftUI

struct NavLContinueWithoutSignIn: View {
    var body: some View {
        NavigationLink {
            RestaurantListPage()
        } label: {
            Text("Continue without sign-In ")
                .font(.system(size: 15, weight: .bold, design: .default))
                .padding(.vertical,15)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                .foregroundColor(Color.blue)
                .padding(.horizontal,35)
                .offset(y:5)
                Spacer()
        }
    }
}

struct NavLContinueWithoutSignIn_Previews: PreviewProvider {
    static var previews: some View {
        NavLContinueWithoutSignIn()
    }
}
