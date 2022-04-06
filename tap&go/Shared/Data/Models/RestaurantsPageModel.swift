//
//  RestaurantsPageModel.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 02/03/2022.
//
import Foundation
import SwiftUI

struct Restaurant : Identifiable,Codable,Hashable {
    let uuid = UUID()
    var id:Int
    var name:String
    var description:String
    var grade:Float
    var localization:String
    var phone_number:String
    var website:String
    var hours:String
}


