//
//  Buttons.swift
//  TinderUI
//
//  Created by Jorge Acosta on 05-08-19.
//  Copyright © 2019 Jorge Acosta. All rights reserved.
//

import SwiftUI

struct Buttons: View {
    
 
    
    var body: some View {
        
        
        
          HStack(alignment: .center){
               
              Button(action:{}){
               Image("redo")
                 .resizable()
                 .frame(width: 22, height: 22)
                 .foregroundColor(Color("redo"))
              }
              .buttonStyle(.rounded)
              .buttonStyle(.small)
             .offset(y:-14.0)
            
              Button(action:{}){
                Image("cancel")
                  .resizable()
                  .frame(width: 22, height: 22)
                  .foregroundColor(Color("red_unlike"))
               }
               .buttonStyle(.rounded)
               .buttonStyle(.big)
            
              Button(action:{}){
                 Image("star")
                   .resizable()
                   .frame(width: 22, height: 22)
                   .foregroundColor(Color("super_like"))
              }
              .buttonStyle(.rounded)
             .buttonStyle(.small)
            
             Button(action:{}){
                 Image("hearth")
                   .resizable()
                   .frame(width: 22, height: 22)
                   .foregroundColor(Color("green_like"))
            }
            .buttonStyle(.rounded)
            .buttonStyle(.big)
            
            Button(action:{}){
                Image("bolt")
                  .resizable()
                  .frame(width: 22, height: 22)
                  .foregroundColor(Color("bolt"))
             }
            .buttonStyle(.rounded)
            .buttonStyle(.small)
            .offset(y:-14.0)
            
           }
           .padding(.bottom, 35)
           .frame(minWidth:0, maxWidth:.infinity)
    }
}

#if DEBUG
struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
#endif

