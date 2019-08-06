//
//  Home.swift
//  TinderUI
//
//  Created by Jorge Acosta on 02-08-19.
//  Copyright © 2019 Jorge Acosta. All rights reserved.
//

import SwiftUI

struct Home: View {
    
  
        
    var body: some View {
            
            VStack(alignment: .leading, spacing: 0.0){
                
                GradientHeader()
                Spacer()
                Buttons()
 
            }
            .background(Color("background"))
            .edgesIgnoringSafeArea(.top)
        }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
