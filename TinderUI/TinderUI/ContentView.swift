//
//  ContentView.swift
//  TinderUI
//
//  Created by Jorge Acosta on 06-08-19.
//  Copyright © 2019 Jorge Acosta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
         TabbedView{
                   Home()
                       .tabItem{
                          Text("Home")
                       }
                       .tag(0)
                   
               }
               .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
