import SwiftUI
import CoreData

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @State private var mediaTitle = ""
    @State private var mediaType = ""
    @State private var discFormat = ""
    @State private var isAlert = false
    @State private var isFavorite = false
    @State var tmdbURL = String()
    
    private let mediaTypes = ["Movie", "TV Show", "Game"]
    private let discTypes = ["4K Blu-ray", "Blu-ray", "DVD"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Main Information")) {
                    TextField("Enter item name", text: $mediaTitle)
                        .disableAutocorrection(true)
                    Picker("Select media type", selection: $mediaType) {
                        ForEach(mediaTypes, id: \.self) { mediaType in
                            Text(mediaType)

                            //Toggle("Do you own this?", isOn: $owned)
                    
                        }
                    }
                    .onAppear {
                        mediaType = "Movie"
                    }
                    Picker("Select disk type", selection: $discFormat) {
                        ForEach(discTypes, id: \.self) { discType in
                            Text(discType)
                            }
                        }
                    .onAppear {
                        discFormat = "4K Blu-ray"
                    }
                }
//                if mediaType == "Movie" || mediaType == "TV Show" {
//                    Section (header: Text("Disc Information")) {
//                        DiscInput()
//                    }
//
//                }
//                else if mediaType == "Game" {
//                    Section (header: Text("Disc Information")) {
//                        GameDiscInput()
//                    }
//                }
                
//                if mediaType == "Movie" {
//                    Section (header: Text("Movie Information")) {
//                        MovieInput()
//                    }
//                }
                
                Button ("Add item") {
                    if self.mediaTitle == "" ||
                        self.mediaType == "" ||
                        self.discFormat == "" {
                        self.isAlert = true
                        return
                    }
                    let coreDB = Entity(context: self.moc)
                    coreDB.id = UUID()
                    coreDB.name = self.mediaTitle
                    coreDB.type = self.mediaType
                    coreDB.format = self.discFormat
                    coreDB.isFavorite = false
                    do {
                        try self.moc.save()
                        dismiss()
                    } catch {
                        print("whoops \(error.localizedDescription)")
                    }
                }
                .alert(isPresented: $isAlert) { () -> Alert in
                    Alert(title: Text("Whoops!"), message: Text("The title shouldn't be empty"), dismissButton: .default(Text("Ok")))
                }
            }
            .navigationBarTitle(Text("Add a new item"))
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}

struct TMDBStructure: Decodable {
    let object: dataStructure
}

struct dataStructure: Decodable {
    let original_title: String
}

#if DEBUG
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
#endif
