//
//  MovieDetail.swift
//  Collectathon
//
//  Created by Chris Kay on 25/06/2022.
//

import Foundation
import CoreData
import SwiftUI

struct OMDBSearchResult: Codable {
    let Search: [OMDBSearchItem]
}

struct OMDBSearchItem: Codable {
    let imdbID: String
}

struct OMDBMovieResult: Decodable {
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

extension OMDBMovieResult: Equatable {}

extension OMDBMovieResult: Identifiable {
    var id: String { imdbID }
}



class OMDBManager {
    
    func getIMDbID(for movieName: String, completion: @escaping (String?) -> Void) {
        let apiKey = "b673d699"
        let query = movieName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "https://www.omdbapi.com/?apikey=\(apiKey)&s=\(query)&type=movie")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(OMDBSearchResult.self, from: data)
                let imdbID = result.Search.first?.imdbID
                completion(imdbID)
            } catch {
                print("Error decoding OMDB search result: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }

    func fetchAndSavePosterImage(for movieName: String, context: NSManagedObjectContext) {
        getIMDbID(for: movieName) { imdbID in
            guard let imdbID = imdbID else { return }
            
            let apiKey = "b673d699"
            let url = URL(string: "https://www.omdbapi.com/?apikey=\(apiKey)&i=\(imdbID)")!
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(OMDBMovieResult.self, from: data)
                    if let posterURLString = result.poster as? String, let posterURL = URL(string: posterURLString) {
                        let posterData = try Data(contentsOf: posterURL)
                        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
                        fetchRequest.predicate = NSPredicate(format: "name == %@", movieName)
                        do {
                            let items = try context.fetch(fetchRequest)
                            if let item = items.first {
                                item.posterData = posterData
                                try context.save()
                                if let savedPosterData = item.posterData {
                                    print("Image saved successfully with size: \(savedPosterData.count) bytes")
                                }
                            } else {
                                let item = Entity(context: context)
                                item.name = movieName
                                item.type = result.type
                                item.posterData = posterData
                                try context.save()
                                if let savedPosterData = item.posterData {
                                    print("Image saved successfully with size: \(savedPosterData.count) bytes")
                                }
                            }
                        } catch {
                            print("Error saving poster image: \(error.localizedDescription)")
                        }
                    }
                } catch {
                    print("Error saving poster image: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
    
    





}




struct MediaDetail: View {
    
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.presentationMode) var presentationMode
    @FetchRequest(sortDescriptors: []) private var loadedMedia: FetchedResults<Entity>
    
    var title = ""
    var mediaType = ""
    var format = ""
    var posterData: Data?
    var entity: Entity?
    
    init(title: String, mediaType: String, format: String, posterData: Data? = nil, entity: Entity? = nil) {
        self.title = title
        self.mediaType = mediaType
        self.format = format
        self.posterData = posterData
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack{
                    Spacer(minLength: 0)
                    MediaBackground()
                }

                if let imageData = posterData, let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .shadow(radius: 10)
                        .frame(height: 300.0)
                        .offset(y: -150)
                        .padding(.bottom, -150)
                } else {
                    MediaCover()
                        .frame(height: 300.0)
                        .offset(y: -150)
                        .padding(.bottom, -150)
                }
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                Divider()
                Text("Media Type: \(mediaType)")
                    .font(.subheadline)
                Text("Disc Format: \(format)")
                    .font(.subheadline)
                Spacer()
                Button("Fetch movie data") {
                    let omdbManager = OMDBManager()
                    omdbManager.fetchAndSavePosterImage(for: self.title, context: self.moc)
                }
            }
            .onAppear {
                if let data = posterData {
                    print("Poster data received: \(data.count) bytes")
                } else {
                    print("No poster data received")
                }
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                presentationMode.wrappedValue.dismiss()
//            }
//        }
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

