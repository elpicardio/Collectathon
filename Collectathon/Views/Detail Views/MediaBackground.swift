//
//  MediaBackground.swift
//  Collectathon
//
//  Created by Chris Kay on 23/08/2022.
//

import SwiftUI

struct MediaBackground: View {
    var body: some View {
        Image("ep3background")
            .resizable()
            .aspectRatio(contentMode: .fit)
        
    }
}

struct MediaBackground_Previews: PreviewProvider {
    static var previews: some View {
        MediaBackground()
    }
}
