//
//  Featured.swift
//  Catalog_v2
//
//  Created by Chris Kay on 22/06/2022.
//

import SwiftUI

struct Featured: View {
    var body: some View {
        Text("Featured content is coming soon")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}

struct Featured_Previews: PreviewProvider {
    static var previews: some View {
        Featured()
    }
}
