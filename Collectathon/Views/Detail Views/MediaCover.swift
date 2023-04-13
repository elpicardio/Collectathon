//
//  MediaCover.swift
//  Collectathon
//
//  Created by Chris Kay on 23/08/2022.
//

import SwiftUI

struct MediaCover: View {
    var body: some View {
        Image("ep3cov")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct MediaCover_Previews: PreviewProvider {
    static var previews: some View {
        MediaCover()
    }
}
