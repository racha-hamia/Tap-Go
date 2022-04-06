//
//  OnBoardingTitle.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 04/03/2022.
//

import SwiftUI

struct OnBoardingTitle: View {
    var body: some View {
        VStack(alignment: .center, spacing: 15){
        Text("TAP & GO")
            .fontWeight(.bold).foregroundColor(.white)
            .font(.system(size: 40, weight: .bold, design: .default)).shadow(color: .black, radius: 1.0, x: 1.0, y: 1.0)
        }
    }
}

struct OnBoardingTitle_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingTitle()
    }
}
