////
////  File.swift
////  Collectathon
////
////  Created by Chris Kay on 23/06/2022.
////
//
//import Foundation
//
//class apiCall {
//    
//    static let apiKey = "7856de5fd6187cc38bc2626114538662"
//    
////    static func getMovieTitle(movieID: Int) {
////        let requestURL = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(apiKey)")!
////        let dataTask = URLSession.shared.dataTask(with: requestURL) { data, response, error in
////            let successRange = 200..<300
////            guard error == nil,
////                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
////                  successRange.contains(statusCode) else {
////                //completion([])
////                return
////            }
////            guard let resultData = data else {
////                //completion([])
////                return
////            }
////            let titles = "placeholder"
////            print("##MovieTitleLoad success!")
////            //completion(titles)
////        }
//        
//        
//        
// //   }
//    
//    //@Published var movieInfo = [MovieBasicInfo]()
//    
//    static func decode<T: Codable>(_ type: T.Type, data: Data) -> T? {
//        do{
//            let response = try JSONDecoder().decode(type, from: data)
//            return response
//        } catch let error {
//            print("##decodingError: \(error.localizedDescription)")
//        }
//        return nil
//    }
//    
//    
//    
//    func getTMDBjson(completion:@escaping ([MovieBasicInfo]) -> ()) {
//        
//        
//        let tmdbURL = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=7856de5fd6187cc38bc2626114538662")!
//        //let tmdbURL = URL(string: "https://jsonplaceholder.typicode.com/comments")!
//        let tmdbDecode = JSONDecoder()
//        tmdbDecode.keyDecodingStrategy = .convertFromSnakeCase
//        
//        URLSession.shared.dataTask(with: tmdbURL) { (data, _, _) in
//            let movieInfo = try! tmdbDecode.decode([MovieBasicInfo].self, from: data!)
//            
//            print(movieInfo)
//
//            DispatchQueue.main.async {
//                completion(movieInfo)
//            }
//            
//        }
//        .resume()
//    }
//}
