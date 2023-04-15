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
//           MoviePosterView(movieTitle: "The Matrix")
//                .tabItem {
//                    Image(systemName: "tv")
//                    Text("TV Shows")
//                }
//            GameView()
//                .tabItem {
//                    Image(systemName: "gamecontroller")
//                    Text("Games")
//                }
        }
        .onAppear {
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        //appearance.backgroundColor = UIColor(Color.orange.opacity(0.2))
        
        // Use this appearance when scrolling behind the TabView:
        UITabBar.appearance().standardAppearance = appearance
        // Use this appearance when scrolled all the way up:
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .preferredColorScheme(.dark)
    }
}
