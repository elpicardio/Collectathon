//
//  MediaBackground.swift
//  Collectathon
//
//  Created by Chris Kay on 23/08/2022.
//

import SwiftUI

struct MediaBackground: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        let height = verticalSizeClass == .regular && horizontalSizeClass == .regular ? 400.0 : 150.0
        
        Image("ep3background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: height)
            .clipped()
    }
}

struct MediaBackground_Previews: PreviewProvider {
    static var previews: some View {
        MediaBackground()
    }
}
