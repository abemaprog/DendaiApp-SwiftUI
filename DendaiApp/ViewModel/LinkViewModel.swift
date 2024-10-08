import SwiftUI

// ViewModel: データの管理と提供
class LinkViewModel: ObservableObject {
    @Published var linkItems: [LinkItem] = []
    
    init() {
        // 初期データの設定（本来はAPIから取得など）
        loadLinks()
    }
    
    func loadLinks() {
        // 固定のリンクデータを作成
        linkItems = [
            // ユニパ
            LinkItem(title: "DENDAI-UNIPA", image: "globe", url: "https://portal.sa.dendai.ac.jp/uprx/"),
            // WebClass
            LinkItem(title: "WebClass", image: "person.crop.circle", url: "https://els.sa.dendai.ac.jp/webclass/login.php"),
            // 年間日程
            LinkItem(title: "年間予定", image: "newspaper", url: "https://www.dendai.ac.jp/about/campuslife/schedule.html"),
        ]
    }
}
