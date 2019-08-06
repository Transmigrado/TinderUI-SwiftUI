//
//  Button+Styles.swift
//  TinderUI
//
//  Created by Jorge Acosta on 01-08-19.
//  Copyright © 2019 Jorge Acosta. All rights reserved.
//

import Foundation
import SwiftUI

public struct Rounded : ButtonStyle {
    public func body(configuration: Button<Self.Label>, isPressed: Bool) -> some View {
        configuration
            .background(Color.white)
            .mask(Circle())
            .shadow(color: Color("Shadow"), radius: 4, x: 0, y: 5)
           
    }
}

public struct Big : ButtonStyle {
    public func body(configuration: Button<Self.Label>, isPressed: Bool) -> some View {
        configuration
            .frame(width: 66, height: 66)
    }
    
}

public struct Small : ButtonStyle {
    public func body(configuration: Button<Self.Label>, isPressed: Bool) -> some View {
        configuration
            .frame(width: 56, height: 56)
    }
    
}

extension StaticMember where Base : ButtonStyle {
    public static var rounded: Rounded.Member {
        StaticMember<Rounded>(Rounded())
    }
    public static var big: Big.Member {
       StaticMember<Big>(Big())
   }
    
    public static var small: Small.Member {
           StaticMember<Small>(Small())
       }
}
