//
//  GameView.swift
//  Catalog_v2
//
//  Created by Chris Kay on 22/06/2022.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) var colorScheme

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Text("Games will go here")
                    Text("Like this")
                    Text("Mass Effect 2 (Example)")
                }
                .navigationTitle("Games")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {showingSheet.toggle()}
                    label: {
                        Image(systemName: "plus")
                        Text("New item")
                    }
                            .buttonStyle(.bordered)
                            .sheet(isPresented: $showingSheet) {
                                AddView()
                            }
                    }
                    }
                        
                    
                
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
