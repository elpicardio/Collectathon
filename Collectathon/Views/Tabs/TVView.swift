//
//  TVView.swift
//  Catalog_v2
//
//  Created by Chris Kay on 21/06/2022.
//

import SwiftUI

struct TVView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) var colorScheme

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                Text("TV Shows will go here")
                Text("Like this")
                Text("Star Trek: Voyager (Example)")
            }
            .navigationTitle("TV Shows")
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

struct TVView_Previews: PreviewProvider {
    static var previews: some View {
        TVView()
    }
}
