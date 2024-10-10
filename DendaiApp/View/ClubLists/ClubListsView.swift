//
//  NewsView.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/08.
//

import SwiftUI

struct ClubListsView: View {
    @StateObject private var clubListsVM = ClubListsViewModel()
    @State private var selectedTab: Int = 0 // 0: 千住, 1: 鳩山
    
    let tabs: [String] = ["千住キャンパス", "鳩山キャンパス"]
    
    var body: some View {
        VStack(spacing: 0) {
            //ヘッダー
            header
            // カスタムタブ (千住キャンパス・鳩山キャンパス)
            TopTabView(list: tabs, selectedTab: $selectedTab)
            
            // 選択されたタブに応じたクラブリストの表示
            if selectedTab == 0 {
                // 千住キャンパス
                CampusTabView(clubs: clubListsVM.senjuClubs)
            } else {
                // 鳩山キャンパス
                CampusTabView(clubs: clubListsVM.hatoyamaClubs)
            }
        }
    }
}

#Preview {
    ClubListsView()
}

extension ClubListsView {
    private var header: some View {
        // ヘッダー
        Text("ClubLists")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.cyan))
    }
    
}
