import SwiftUI

class ClubListsViewModel: ObservableObject {
    @Published var clubs: [ClubListItem] = []
    
    init() {
        loadClubs()
    }
    
    func loadClubs() {
        // クラブデータをカテゴリごとに設定
        clubs = [
            // 千住
            ClubListItem(name: "サッカー部", url: "https://www.example.com/soccer", category: .sports, campus: .senju),
            ClubListItem(name: "バスケットボール部", url: "https://www.example.com/basketball", category: .sports, campus: .senju),
            ClubListItem(name: "委員会サークル", url: "https://www.example.com/committee", category: .committee, campus: .senju),
            // 鳩山
            ClubListItem(name: "軽音サークル", url: "https://www.example.com/music", category: .culture, campus: .hatoyama),
            ClubListItem(name: "学術研究サークル", url: "https://www.example.com/research", category: .academic, campus: .hatoyama),
            ClubListItem(name: "工学部第二部", url: "https://www.example.com/engineering", category: .engineering, campus: .hatoyama)
        ]
    }
    
    // 千住キャンパスに属するクラブをフィルタリング
    var senjuClubs: [ClubListItem] {
        return clubs.filter { $0.campus == .senju }
    }
    
    // 鳩山キャンパスに属するクラブをフィルタリング
    var hatoyamaClubs: [ClubListItem] {
        return clubs.filter { $0.campus == .hatoyama }
    }
}
