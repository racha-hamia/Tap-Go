//
//  SearchBar.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 05/03/2022.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        VStack(spacing: 15){
            HStack(spacing: 15){
                Image(systemName: "magnifyingglass").font(.title).foregroundColor(Color.brown)
                TextField("Search",text: .constant("")).disabled(false).foregroundColor(Color.brown)
            }.padding(.vertical,12).padding(.horizontal).background(
                Capsule()
                    .strokeBorder(Color.brown,lineWidth: 0.8))
        }.padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
