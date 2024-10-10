import SwiftUI

struct CampusTabView: View {
    @State private var selectedTab: Int = 0 // 0: 千住, 1: 鳩山
    @StateObject private var viewModel = ClubListsViewModel()
    
    let tabs: [String] = ["千住キャンパス", "鳩山キャンパス"]
    
    var body: some View {
        VStack(spacing: 0) {
            // カスタムタブ (千住キャンパス・鳩山キャンパス)
            TopTabView(list: tabs, selectedTab: $selectedTab)
            
            // 選択されたタブに応じてビューを切り替え
            if selectedTab == 0 {
                SenjuClubView(clubListsVM: viewModel)
            } else {
                HatoyamaClubView(clubListsVM: viewModel)
            }
        }
        .navigationTitle("サークル・部活動")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CampusTabView()
}
