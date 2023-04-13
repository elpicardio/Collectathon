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
    //@FetchRequest(sortDescriptors: []) var loadedMedia: FetchedResults<MyDiscs>
    //@Environment(\.managedObjectContext) var moc
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            MovieView(filter: "Movie")
                .tabItem {
                    Image(systemName: "film")
                    Text("Movies")
                }
            TVView(filter: "TV Show")
                .tabItem {
                    Image(systemName: "tv")
                    Text("TV Shows")
                }
//            GameView()
//                .tabItem {
//                    Image(systemName: "gamecontroller")
//                    Text("Games")
//                }
        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .preferredColorScheme(.dark)
    }
}
