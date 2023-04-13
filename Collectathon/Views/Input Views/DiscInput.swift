//
//  MovieInput.swift
//  Catalog_v2
//
//  Created by Chris Kay on 22/06/2022.
//

import SwiftUI



struct DiscInput: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @State private var discType = ""
    @State private var owned = false
    @State private var isAlert = false
    
    private let discTypes = ["4K Blu-ray", "Blu-ray", "4K Blu-ray + Blu-ray", "DVD"]
    
    var body: some View {
        Picker("Select media type", selection: $discType) {
            ForEach(discTypes, id: \.self) { discType in
                    Text(discType)
                }
            }
        Toggle("Do you own this?", isOn: $owned)
    }
}

struct DiscInput_Previews: PreviewProvider {
    static var previews: some View {
        DiscInput()
    }
}
