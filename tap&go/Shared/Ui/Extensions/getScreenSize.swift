//
//  getScreenSize.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 04/03/2022.
//

import Foundation
import SwiftUI

extension View {
    func getScreenSize()->CGRect
    {
        return UIScreen.main.bounds
    }
}
