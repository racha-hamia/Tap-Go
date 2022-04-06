//
//  MenusModel.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 06/03/2022.
//

import Foundation

import SwiftUI

struct Menu : Identifiable,Codable,Hashable {
    let uuid = UUID()
    var id:Int
    var name:String
    var description:String
    var price:Float
}
