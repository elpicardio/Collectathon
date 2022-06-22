//
//  AddView.swift
//  CoreData_SwiftUI
//
//  Created by Anmol Maheshwari on 10/05/20.
//  Copyright © 2020 Anmol Maheshwari. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @State private var mediaTitle = ""
    @State private var mediaType = ""
    @State private var isAlert = false
    
    private let mediaTypes = ["Movie", "TV Show", "Game"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Main Information")) {
                    TextField("Enter item name", text: $mediaTitle)
                        .disableAutocorrection(true)
                    Picker("Select media type", selection: $mediaType) {
                        ForEach(mediaTypes, id: \.self) { mediaType in
                            Text(mediaType)
                        }
                    }
                }
                if mediaType == "Movie" || mediaType == "TV Show" {
                    Section (header: Text("Disc Information")) {
                        DiscInput()
                    }

                }
                else if mediaType == "Game" {
                    Section (header: Text("Disc Information")) {
                        GameDiscInput()
                    }
                }
                
                if mediaType == "Film" {
                    Section (header: Text("Film Information")) {
                        MovieInput()
                    }
                }
                
                Button ("Add item") {
                    if self.mediaTitle == "" ||
                        self.mediaType == "" {
                        self.isAlert = true
                        return
                    }
                    //let userInfo = FilmMedia(context: self.moc)
                    //userInfo.firstName = self.firstName
                    //userInfo.lastName = self.lastName
                    //userInfo.gender = self.gender
                    do {
                        try self.moc.save()
                    } catch {
                        print("whoops \(error.localizedDescription)")
                    }
                }
                .alert(isPresented: $isAlert) { () -> Alert in
                    Alert(title: Text("Whoops!"), message: Text("No text field should be empty"), dismissButton: .default(Text("Ok")))
                }
            }
            .navigationBarTitle(Text("Add new item"))
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

#if DEBUG
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
#endif
