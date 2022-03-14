//
//  ContentView.swift
//  Multipeer Familiarization
//
//  Created by Christian DeVivo on 3/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
          NavigationView {
            MainView()
          }
          .navigationViewStyle(StackNavigationViewStyle())
          .tabItem {
            Image(systemName: "briefcase")
            Text("Jobs")
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
