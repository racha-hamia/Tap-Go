//
//  RadiusCorners.swift
//  tap&go (iOS)
//
//  Created by Jessy Habert on 26/02/2022.
//

import SwiftUI

struct RadiusCorners: Shape {
  
    var corners : UIRectCorner
    var radius : CGFloat
    
    func path(in rect : CGRect) -> Path{
        let path = UIBezierPath(
            roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(
                width : radius,height : radius
            )
        )
        return Path(path.cgPath)
    }
}
