import SwiftUI
import WebKit

// データの管理と提供
class LinkViewModel: ObservableObject {
    @Published var linkItems: [LinkItem] = []
    
    init() {
        // リンクを読み込む
        loadLinks()
    }
    
    func loadLinks() {
        linkItems = [
            // ユニパ
            LinkItem(title: "DENDAI-UNIPA", image: "globe", url: "https://portal.sa.dendai.ac.jp/uprx/"),
            // WebClass
            LinkItem(title: "WebClass", image: "leaf", url: "https://els.sa.dendai.ac.jp/webclass/login.php"),
            // 年間日程
            LinkItem(title: "年間予定", image: "calendar", url: "https://www.dendai.ac.jp/about/campuslife/schedule.html"),
            //　総合メディアセンター
            LinkItem(title: "総合メディアセンター", image: "book", url: "https://www.mrcl.dendai.ac.jp/mrcl/#gsc.tab=0")
        ]
    }
}
