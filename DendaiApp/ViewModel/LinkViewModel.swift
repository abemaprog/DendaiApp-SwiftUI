import SwiftUI
import WebKit

// データの管理と提供
class LinkViewModel: ObservableObject {
    @Published var linkItems: [LinkItem] = []
    @Published var otherLinkItems: [LinkItem] = []
    
    init() {
        // リンクを読み込む
        loadLinks()
    }
    
    func loadLinks() {
        linkItems = [
            // ユニパ
            LinkItem(title: "DENDAI-UNIPA", image: "globe", url: "https://portal.sa.dendai.ac.jp/uprx/", color: .blue),
            // WebClass
            LinkItem(title: "WebClass", image: "leaf", url: "https://els.sa.dendai.ac.jp/webclass/login.php", color: .green),
            // 年間日程
            LinkItem(title: "年間予定", image: "calendar", url: "https://www.dendai.ac.jp/about/campuslife/schedule.html", color: .red),
            //　総合メディアセンター
            LinkItem(title: "総合メディアセンター", image: "book", url: "https://www.mrcl.dendai.ac.jp/mrcl/#gsc.tab=0", color: .purple),
            // 教科書購入サイト
            LinkItem(title: "教科書販売", image: "books.vertical", url: "https://tdu-coop.jp/", color: .yellow),
            //　科学技術概論
            LinkItem(title: "科学技術概論ポータルサイト", image: "gear", url: "https://tdu-sc.notion.site/6237e3b95b3f4090aa0ee3f57617e028", color: .gray),
            // Physics-e
            LinkItem(title: "Physics-e", image: "waveform.path.ecg", url: "https://ptg01.physics-e.com/DENDAI/Physicse/users/", color: .indigo),
        ]
        
        otherLinkItems = [
            // 電大navi
            LinkItem(title: "電大navi", image: "location", url: "https://tdu-navi.sg.dendai.ac.jp/", color: .teal),
            // 公式X
            LinkItem(title: "公式X", image: "bubble.right", url: "https://x.com/TDU_webmaster?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor", color: .gray),
        ]
    }
}
