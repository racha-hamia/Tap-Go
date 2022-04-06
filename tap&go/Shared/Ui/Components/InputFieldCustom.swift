//
//  InputFieldCustom.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 04/03/2022.
//

import SwiftUI

struct InputFieldCustom: View {
    @State var icon : String
    @State var title: String
    @State var hint: String
    @State var fontColor: Bool
    @Binding var value:String
    @Binding var showPassword:Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(title)
            } icon:{
                Image(systemName: icon)
            }.foregroundColor(fontColor ? Color.brown.opacity(0.8) : Color.white.opacity(0.8))
            if title.contains("Password") && !$showPassword.wrappedValue{
                SecureField(hint, text:$value).padding()
                    .padding(.top,2)
                    .foregroundColor(fontColor ? .brown : .white)
            }
            else {
                TextField(hint, text:$value).padding()
                    .foregroundColor(fontColor ? .brown : .white)
                    
                    .padding(.top,2)
            }
            Divider()
                .background(fontColor ? Color.brown : Color.white)
        }.overlay(Group{
            if title.contains("Password"){
            Button(
                action :{
                    $showPassword.wrappedValue.toggle()
                },
                label : {
                    Text($showPassword.wrappedValue ? "Tap to hide" : "Tap to unhide")
                        .foregroundColor(fontColor ? .brown : .white)
                }).offset(y:8)}
        },alignment: .trailing)
    }
}

struct InputFieldCustom_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldCustom(icon: "person", title: "Password", hint: "Please Type Your Name",fontColor:true, value: .constant(""), showPassword: .constant(true))
    }
}
