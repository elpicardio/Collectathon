//
//  MovieView.swift
//  Catalog_v2
//
//  Created by Chris Kay on 21/06/2022.
//

import SwiftUI
import CoreData

struct MovieView: View {
    
    //@FetchRequest(sortDescriptors: []) private var loadedMedia: FetchedResults<Entity>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Entity.name, ascending: true)]) var fetchRequest: FetchedResults<Entity>
    @FetchRequest(entity: Entity.entity(),sortDescriptors: [
        NSSortDescriptor(keyPath: \Entity.id, ascending: true),
        NSSortDescriptor(keyPath: \Entity.name, ascending: true)
    ]) private var movies: FetchedResults<Entity>
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.editMode) private var editMode
    @Environment(\.managedObjectContext) var moc

    @State private var mediaTypeFilter = "Movie"
    @State private var showingSheet = false
    @State var selectKeeper = Set<String>()
    @State private var queryString = ""
    
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(fetchRequest) { item in
                    NavigationLink(destination: MediaDetail(title: item.name!, mediaType: item.type!, format: item.format!, posterData: item.posterData, entity: item)) {
                        Text(item.name ?? "No movies have been added")
                            .onAppear {
                                print("name: \(item.name ?? "nil"), type: \(item.type ?? "nil"), format: \(item.format ?? "nil"), posterData size: \(item.posterData?.count ?? 0)")
                            }
                    }



                }
                .onDelete(perform: deleteMovie)
                .navigationViewStyle(StackNavigationViewStyle())
                
            }
            .navigationTitle("Movies")
            .navigationBarItems(trailing: EditButton())
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {showingSheet.toggle()}
                    label: {Image(systemName: "plus")}
                    .buttonStyle(.bordered)
                    .sheet(isPresented: $showingSheet) {
                        AddView()
                            .environment(\.managedObjectContext, self.moc)
                        }
                    }
                }
            }
        }
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Entity>(sortDescriptors: [NSSortDescriptor(keyPath: \Entity.name, ascending: true)], predicate: NSPredicate(format: "type BEGINSWITH %@", mediaTypeFilter))
    }
    
    
    func deleteMovie(at offsets: IndexSet) {
        for offset in offsets {
            let movie = movies[offset]
            moc.delete(movie)
        }
        
        try? moc.save()
    }
}

//struct MovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieView()
//            //.environment(\.managedObjectContext, persistenceController.container.viewContext)
//            .preferredColorScheme(.dark)
//    }
//}
