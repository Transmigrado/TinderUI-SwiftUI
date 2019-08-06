//
//  GradientHeader.swift
//  TinderUI
//
//  Created by Jorge Acosta on 02-08-19.
//  Copyright © 2019 Jorge Acosta. All rights reserved.
//

import SwiftUI

struct GradientHeader: View {
    var body: some View {
         VStack{
           Text("Discover")
               .font(.system(size:30))
               .bold()
               .foregroundColor(.white)
               .offset(x:25, y: 25)
               
          }
          .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
          .frame(height: 180)
          .background(LinearGradient(gradient: Gradient(colors: [Color("left_gradient_color"),Color("rigth_gradient_color")]), startPoint: .leading, endPoint: .trailing))
        
    
    }
}

#if DEBUG
struct GradientHeader_Previews: PreviewProvider {
    static var previews: some View {
        GradientHeader()
    }
}
#endif
