import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack {
            // ヘッダー
            header
            // 設定リスト
            settingList
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    MyPageView()
}

extension MyPageView {
    // カスタムヘッダー
    private var header: some View {
        Text("MyPage")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.cyan))
    }
    
    // 設定リストをSectionで表示
    private var settingList: some View {
        List {
            // お問い合わせ
            Section(header: customSectionHeader(title: "フィードバック")) {
                
                NavigationLink(destination: Text("お問い合わせ")) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                        Text("お問い合わせ")
                    }
                }
                NavigationLink(destination: Text("レビュー")) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("レビューのお願い")
                    }
                }
            }
            
            // アプリ情報
            Section(header: customSectionHeader(title: "アプリ情報")) {
                HStack {
                    Image(systemName: "info.circle.fill") // 情報アイコン
                        .foregroundColor(.green)
                    Text("バージョン：\(appVersion)") // バージョン情報は静的に表示
                }
                NavigationLink(destination: Text("プライバシーポリシー")) {
                    HStack {
                        Image(systemName: "shield.fill")
                            .foregroundColor(.purple)
                        Text("プライバシーポリシー")
                    }
                }
                NavigationLink(destination: Text("利用規約")) {
                    HStack {
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(.gray)
                        Text("利用規約")
                    }
                }
            }
        }
    }
    
    // カスタムヘッダー
    private func customSectionHeader(title: String) -> some View {
        Text(title)
            .font(.headline)
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
    }
    // アプリのバージョンとビルド番号を取得するプロパティ
    private var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String{
            return "\(version)"
        }
        return "情報が取得できません"
    }
}
