import SwiftUI

struct MyPageView: View {
    @ObservedObject private var myPageVM = MyPageViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // ヘッダー
                header
                // 設定リスト
                settingList
            }
            .background(Color(.systemGray6))
        }
    }
}

#Preview {
    MyPageView()
}

extension MyPageView {
    // ヘッダー
    private var header: some View {
        Text("MyPage")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.cyan)
    }
    
    // 設定リストをSectionで表示
    private var settingList: some View {
        List {
            // フィードバックセクション
            Section(header: Text("フィードバック")) {
                NavigationLink(destination: WebView(url: URL(string: myPageVM.pageItem.contactURL)!)
                    .navigationTitle("お問い合わせ")) {
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.blue)
                            Text("お問い合わせ")
                        }
                    }
                NavigationLink(destination: WebView(url: URL(string: myPageVM.pageItem.displayCircleURL)!)
                    .navigationTitle("部活・サークル掲載希望")) {
                        HStack {
                            Image(systemName: "megaphone.fill")
                                .foregroundColor(.orange)
                                .rotationEffect(.degrees(-15))
                            Text("部活・サークル掲載希望")
                        }
                    }
//                アプリが世に出てから追加する
//                NavigationLink(destination: Text("レビュー")) {
//                    HStack {
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.yellow)
//                        Text("レビュー")
//                    }
//                }
            }
            
            // アプリ情報セクション
            Section(header: Text("アプリ情報")) {
                HStack {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.green)
                    Text("バージョン：\(appVersion)")
                }
                NavigationLink(destination: WebView(url: URL(string: myPageVM.pageItem.privacyPolicyURL)!)
                    .navigationTitle("プライバシーポリシー")) {
                        HStack {
                            Image(systemName: "shield.fill")
                                .foregroundColor(.purple)
                            Text("プライバシーポリシー")
                        }
                    }
                NavigationLink(destination: WebView(url: URL(string: myPageVM.pageItem.termsOfServiceURL)!)
                    .navigationTitle("利用規約")) {
                        HStack {
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(.gray)
                            Text("利用規約")
                        }
                    }
            }
        }
    }
    
    // アプリのバージョンを取得するプロパティ
    private var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return "\(version)"
        }
        return "情報が取得できません"
    }
}
