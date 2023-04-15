import Foundation
import SwiftUI
import CoreData

//struct TMDBSearchResult: Codable {
//    let results: [TMDBSearchItem]
//}
//
//struct TMDBSearchItem: Codable {
//    let id: Int
//}
//
//
//class MovieManager {
//    
//    func getMovieID(for movieName: String, completion: @escaping (Int?) -> Void) {
//        let apiKey = "7856de5fd6187cc38bc2626114538662"
//        let query = movieName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(query)")!
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                completion(nil)
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let result = try decoder.decode(TMDBSearchResult.self, from: data)
//                let movieID = result.results.first?.id
//                completion(movieID)
//            } catch {
//                print("Error decoding TMDB search result: \(error.localizedDescription)")
//                completion(nil)
//            }
//        }.resume()
//    }
//
//    func fetchAndSavePosterImage(for movieName: String, context: NSManagedObjectContext) {
//        @Environment(\.managedObjectContext) var moc
//        
//        getMovieID(for: movieName) { movieID in
//            guard let movieID = movieID else { return }
//            
//            let apiKey = "7856de5fd6187cc38bc2626114538662"
//            let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/images?api_key=\(apiKey)")!
//            
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                guard let data = data else { return }
//                
//                let item = Entity(context: moc)
//                item.posterData = data
//                
//                do {
//                    try moc.save()
//                } catch {
//                    print("Error saving poster image: \(error.localizedDescription)")
//                }
//            }.resume()
//        }
//    }
//}
