//
//  GameDiscInput.swift
//  Catalog_v2
//
//  Created by Chris Kay on 22/06/2022.
//

import SwiftUI

struct GameDiscInput: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @State private var format = ""
    @State private var owned = false
    @State private var digitalCopy = false
    @State private var isAlert = false
    
    private let formats = ["Playstation 3", "Playstation 4", "Xbox 360", "Xbox One", "Xbox Series X", "Nintendo Switch"]
    
    var body: some View {
        Picker("Select game console", selection: $format) {
            ForEach(formats, id: \.self) { format in
                    Text(format)
                }
            }
        Toggle("Do you own this?", isOn: $owned)
        Toggle("Is this a digital copy?", isOn: $digitalCopy)
    }
}

struct GameDiscInput_Previews: PreviewProvider {
    static var previews: some View {
        GameDiscInput()
    }
}
