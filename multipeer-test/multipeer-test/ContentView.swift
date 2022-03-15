//
//  ContentView.swift
//  Multipeer test
//
//  Created by Christian DeVivo on 3/14/22.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var homeViewType: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {

        Text("ACTIVATE CONNECTION")
            .padding()
            .navigationTitle("SwiftUI Rylo")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    
                    ZStack {
                        Button(action: {
                            self.homeViewType = "home"
                        }) {
                            Text("Home")
                        }
                    }
                    
                    ZStack {
                        Button(action: {
                            self.homeViewType = "likedusers"
                        }) {
                            Text("Liked Users")
                        }
                    }
                    
                    ZStack {
                        Button(action: {
                            self.homeViewType = "profile"
                        }) {
                            Text("Profile")
                        }
                    }

                }
            }
        
    }
}
