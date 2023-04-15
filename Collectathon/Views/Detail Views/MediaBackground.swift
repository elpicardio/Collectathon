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
        let height = verticalSizeClass == .regular && horizontalSizeClass == .regular ? 400.0 : 250.0
        
        Text("No Backdrop Saved")
            .foregroundColor(Color.red)
            .multilineTextAlignment(.center)
            .frame(height: height)
            .frame(maxWidth: .infinity, alignment: .top)
            .background(.ultraThinMaterial)
    }
}

struct MediaBackground_Previews: PreviewProvider {
    static var previews: some View {
        MediaBackground()
    }
}
