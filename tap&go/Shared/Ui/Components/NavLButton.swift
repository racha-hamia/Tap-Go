//
//  NavLButton.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 04/03/2022.
//

import SwiftUI

struct NavLButton: View {
    @State var title:String
    @State var color:Bool = true
    var body: some View {
        NavigationLink {
            if color { RegisterPage() }
            else{
                LoginPage()
            }
        } label: {
            Text(title)
                .font(.system(size: 18, weight: .bold, design: .default))
                .frame(maxWidth: .infinity)
                .padding(.vertical,19)
                .background(color ? Color.white : Color.brown)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                .foregroundColor(Color.black)
                .padding(.horizontal,35)
                .offset(y:15)
                Spacer()
                
        }.shadow(color: .black, radius: 1.0, x: 1.0, y: 1.0)
    }
}

struct NavLButton_Previews: PreviewProvider {
    static var previews: some View {
        NavLButton(title:"Preview",color:true)
    }
}
