//
//  RegisterTitle.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 04/03/2022.
//

import SwiftUI

struct RegisterTitle: View {
    var body: some View {
        VStack{
            Text("Welcome").font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(.brown).frame(maxWidth:.infinity,alignment: .leading).shadow(color: .black, radius: 0.5, x: 2.0, y: 2.0)
            
            Text("to ").font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(.brown).frame(maxWidth:.infinity,alignment: .center).shadow(color: .black, radius: 0.5, x: 2.0, y: 2.0)
            
            Text("Tap & Go").font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.brown).frame(maxWidth:.infinity,alignment: .trailing)
                .font(.system(.title, design: .rounded)).shadow(color: .black, radius: 0.5, x: 2.0, y: 2.0)
        }
    }
}

struct RegisterTitle_Previews: PreviewProvider {
    static var previews: some View {
        RegisterTitle()
    }
}
