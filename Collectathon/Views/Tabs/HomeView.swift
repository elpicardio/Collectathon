//
//  HomeView.swift
//  Collectathon
//
//  Created by Christine Kay on 14/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            List {
                Text("Hello Collectathon")
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {showingSheet.toggle()}
                    label: {Image(systemName: "info.circle")}
                    .buttonStyle(.bordered)
                    .sheet(isPresented: $showingSheet) {
                        SettingsView()
                        }
                    }
            }
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
