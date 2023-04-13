//
//  MovieDetail.swift
//  Collectathon
//
//  Created by Chris Kay on 25/06/2022.
//

import SwiftUI
import CoreData

struct MediaDetail: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) private var loadedMedia: FetchedResults<Entity>
    //let context = Persistence.container.viewContext
    
    var title = ""
    var mediaType = ""
    var format = ""
    //var idImport = UUID()
    
    var body: some View {
        VStack {
            MediaBackground()
            MediaCover()
                .frame(height: 250.0)
                .offset(y: -150)
                .padding(.bottom, -150)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)
            Divider()
            HStack {
                Text("Media Type: \(mediaType)")
                    .font(.subheadline)

                Spacer()
                Text("Disc Format: \(format)")
                    .font(.callout)
            }
            .padding()
            Text("Core Data ID is ")
            Spacer()
        }
    }
}

struct MediaDetail_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetail(title: "Star Wars: Episode III - Revenge of The Sith", mediaType: "Movie", format: "4K Blu-ray")
    }
}

//func deleteProfile(withID: Int) {
//    let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
//    fetchRequest.predicate = Predicate.init(format: "profileID==\(withID)")
//    let object = try! context.fetch(fetchRequest)
//    context.delete(object)
//}

