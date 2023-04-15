//
//  TVView.swift
//  Catalog_v2
//
//  Created by Chris Kay on 21/06/2022.
//

import SwiftUI

struct TVView: View {
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Entity.name, ascending: true)]) var fetchRequest: FetchedResults<Entity>
    @FetchRequest(entity: Entity.entity(),sortDescriptors: [
        NSSortDescriptor(keyPath: \Entity.id, ascending: true),
        NSSortDescriptor(keyPath: \Entity.name, ascending: true)
    ]) private var movies: FetchedResults<Entity>
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.editMode) private var editMode
    @Environment(\.managedObjectContext) var moc
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
