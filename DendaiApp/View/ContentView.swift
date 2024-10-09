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
            MemoView()
                .tabItem {
                    Image(systemName: "document")
                    Text("Memos")
                }
            ClubListsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("ClubLists")
                }
            LinkView()
                .tabItem {
                    Image(systemName: "link")
                    Text("Links")
                }
            MyPageView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("MyPage")
                }
        }
    }
}
#Preview {
    ContentView()
}
