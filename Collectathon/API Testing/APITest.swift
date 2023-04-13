//import SwiftUI
//
//struct APITest: View {
//    @State var gifUrl = String()
//    @State var searchString = String()
//
//    var body: some View {
//        Text("\(gifUrl)")
//            .onTapGesture {
//                let url = URL(string: gifUrl)
//                guard let GIPHYUrl = url, UIApplication.shared.canOpenURL(GIPHYUrl) else {return}
//                UIApplication.shared.open(GIPHYUrl)
//            }
//        TextField("Search GIFs", text: $searchString)
//            .multilineTextAlignment(.center)
//        Button("Fetch GIF"){fetchAPI()}
//    }
//
//    func fetchAPI() {
//        let apiKey = "7856de5fd6187cc38bc2626114538662"
//        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&language=en-US&query=\(self.searchString)")
//
//
//        URLSession.shared.dataTask(with: url!) { data, response, error in
//            if let data = data {
//                if let decodedGiphy = try? JSONDecoder().decode(GIPHYStructure.self, from: data){
//                    self.gifUrl = decodedGiphy.data[0].url
//                }
//            }
//        }.resume()
//    }
//}
//
//
//struct GIPHYStructure: Decodable {
//    let resuts: [dataStructure]
//}
//
//struct dataStructure: Decodable {
//    let url: String
//}
//
//struct APITest_Previews: PreviewProvider {
//    static var previews: some View {
//        APITest()
//    }
//}
