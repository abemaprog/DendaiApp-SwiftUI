//
//  ContentView.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            MediaView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("ClubLists")
                }
            LinkView()
                .tabItem {
                    Image(systemName: "link")
                    Text("Links")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Setting")
                }
        }
    }
}

#Preview {
    ContentView()
}
