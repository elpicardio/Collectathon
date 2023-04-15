//
//  MoviePosterView.swift
//  Collectathon
//
//  Created by Christine Kay on 15/04/2023.
//

import SwiftUI

struct MovieData: Codable, Hashable {
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var posterURL: URL?

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case posterURL = "Poster"
    }
}

struct MoviePosterView: View {
    let movieTitle: String
    
    @State private var posterImage: UIImage? = nil
    
    var body: some View {
        if let posterImage = posterImage {
            Image(uiImage: posterImage)
                .resizable()
                .frame(width: 900, height: 900)
                .aspectRatio(contentMode: .fit)
        } else {
            ProgressView()
                .onAppear {
                    fetchPoster()
                }
        }
    }
    
    func fetchPoster() {
        let apiKey = "b673d699"
        let encodedTitle = movieTitle.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let urlString = "https://www.omdbapi.com/?apikey=\(apiKey)&t=\(encodedTitle)&type=movie"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let movieData = try? decoder.decode(MovieData.self, from: data) else {
                return
            }
            
            guard let posterURL = movieData.posterURL, let url = URL(string: posterURL.absoluteString) else {
                return
            }
            
            downloadPoster(from: url)
        }.resume()
    }
    
    func downloadPoster(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                posterImage = UIImage(data: data)
            }
        }.resume()
    }
}

struct MoviePosterView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterView(movieTitle: "The Matrix")
    }
}
