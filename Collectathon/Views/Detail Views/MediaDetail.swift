//
//  MovieDetail.swift
//  Collectathon
//
//  Created by Chris Kay on 25/06/2022.
//

import SwiftUI
import CoreData

struct TMDBSearchResult: Codable {
    let results: [TMDBSearchItem]
}

struct TMDBSearchItem: Codable {
    let id: Int
}


class MovieManager {
    
    func getMovieID(for movieName: String, completion: @escaping (Int?) -> Void) {
        let apiKey = "7856de5fd6187cc38bc2626114538662"
        let query = movieName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(query)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(TMDBSearchResult.self, from: data)
                let movieID = result.results.first?.id
                completion(movieID)
            } catch {
                print("Error decoding TMDB search result: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }

    func fetchAndSavePosterImage(for movieName: String, context: NSManagedObjectContext) {
        getMovieID(for: movieName) { movieID in
            guard let movieID = movieID else { return }
            
            let apiKey = "7856de5fd6187cc38bc2626114538662"
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/images?api_key=\(apiKey)")!
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                
                let item = Entity(context: context)
                item.posterData = data
                
                do {
                    try context.save()
                    print("Image saved successfully")
                } catch {
                    print("Error saving poster image: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
}


struct MediaDetail: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: []) private var loadedMedia: FetchedResults<Entity>
    //let context = Persistence.container.viewContext
    
    var title = ""
    var mediaType = ""
    var format = ""
    var posterData: Data?
    //var idImport = UUID()
    
    var body: some View {
        if let imageData = posterData, let image = UIImage(data: imageData) {
            Image(uiImage: image)
        } else {
            MediaCover()
        }

//                .frame(height: 250.0)
//                .offset(y: -150)
//                .padding(.bottom, -150)
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
            Button("Fetch poster image") {
                            let movieManager = MovieManager()
                            movieManager.getMovieID(for: title) { movieID in
                                if let movieID = movieID {
                                    print("Movie ID for \(title): \(movieID)")
                                    movieManager.fetchAndSavePosterImage(for: title, context: moc)
                                } else {
                                    print("Could not find movie ID for \(title)")
                                }
                            }
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

