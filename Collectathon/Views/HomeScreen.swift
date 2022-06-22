//
//  HomeScreen.swift
//  Catalog_v2
//
//  Created by Chris Kay on 21/06/2022.
//

import SwiftUI
import CoreData

struct HomeScreen: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView {
            Featured()
                .tabItem{
                    Image(systemName: "star")
                    Text("Featured")
                }
           MovieView()
             .tabItem {
                Image(systemName: "film")
                Text("Movies")
           }
           TVView()
             .tabItem {
                Image(systemName: "tv")
                Text("TV Shows")
          }
            GameView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .preferredColorScheme(.dark)
    }
}
