//
//  MovieInput.swift
//  Catalog_v2
//
//  Created by Chris Kay on 22/06/2022.
//

import SwiftUI
import Combine

struct MovieInput: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @State private var director = ""
    @State private var year = ""
    //@State private var owned = false
    @State private var isAlert = false
    
    //private let discTypes = ["4K Blu-ray", "Blu-ray", "4K Blu-ray + Blu-ray", "DVD"]
    
    var body: some View {
        //Picker("Select media type", selection: $discType) {
        //    ForEach(discTypes, id: \.self) { discType in
        //            Text(discType)
        //        }
        //    }
        //Toggle("Do you own this?", isOn: $owned)
        TextField("Enter the director", text: $director)
            .disableAutocorrection(true)
        TextField("Year of release?", text: $year)
            .keyboardType(.numberPad)
            .onReceive(Just(year)) { newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                    self.year = filtered
                }
            }
    }
}

struct MovieInput_Previews: PreviewProvider {
    static var previews: some View {
        MovieInput()
    }
}
