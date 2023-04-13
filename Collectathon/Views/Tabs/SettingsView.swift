//
//  SettingsView.swift
//  Catalog_v2
//
//  Created by Chris Kay on 22/06/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    let defaultURL = URL(string: "https://www.google.co.uk")!
    let youtubeURL = URL(string: "https://www.youtube.co.uk")!
    let githubURL = URL(string: "https://www.github.com")!
    let movieDBURL = URL(string: "https://www.themoviedb.org")!
    let twitterPersonalURL = URL(string: "https://twitter.com/thatkwistine")!
    //let somethingURL = URL(string: "website")!
    
    var body: some View {
        
        NavigationView {
            List {
                collectathonSection
                //movieDBSection
                devSection
                applicationSection
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar() {
                ToolbarItem(placement: .primaryAction) {
                    Button {dismiss()}
                label: {
                    Image(systemName: "multiply")
                }

                }
            }
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


extension SettingsView {
    
    private var collectathonSection: some View {
        Section(header: Text("Collectathon")) {
            VStack(alignment: .leading) {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 100,height: 100, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("Collectathon is your personal media collection available for your reference at any time across devices and on the go!")
                        .multilineTextAlignment(.center)
                        .font(.callout)
                }

                
                    
            }
            .padding(.vertical)
            Link("View Collectathon on GitHub!", destination: githubURL)
        }
    }
    
    private var movieDBSection: some View {
        Section(header: Text("The Movie Database")) {
            VStack(alignment: .leading) {
                Image("movieDBlogo")
                    .resizable()
                    .frame(height:32)
                    .scaledToFit()
                Text("The Movie and TV Show information that is used by this app is provided by The Movie Database")
                    .multilineTextAlignment(.center)
                    .font(.callout)
                
                    
            }
            .padding(.vertical)
            Link("The Movie DB", destination: movieDBURL)
        }
    }
    
    private var devSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("This app was made by Christine Kay under CK Apps as a passion project for personal use and is written in 100% SwiftUI and uses CoreData for persistant storage.")
                        .multilineTextAlignment(.center)
                        .font(.callout)
                }
            }
            .padding(.vertical)
            Link("View me on Twitter!", destination: twitterPersonalURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: twitterPersonalURL)
            Link("Privacy Policy", destination: twitterPersonalURL)
            Link("Website", destination: twitterPersonalURL)
            Link("Learn More", destination: twitterPersonalURL)
        }
    }
    
}
