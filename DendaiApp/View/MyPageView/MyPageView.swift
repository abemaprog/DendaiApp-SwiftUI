import SwiftUI
import WebUI

struct MyPageView: View {
    var body: some View {
        
        VStack {
            // ヘッダー
            CustomHeader(label: "MyPage")
            
            // 設定リスト
            List {
                Section("フィードバック") {
                    //お問い合わせ
                    WebSection(iconname: "envelope.fill", iconColor: .blue, title: "お問い合わせ", url: URL(string: "https://forms.gle/CeYvvMUhhJLCnKxD8")!)
                    // 部活・サークル掲載
                    WebSection(iconname: "megaphone.fill", iconColor: .orange, title: "部活・サークル掲載希望", url: URL(string: "https://forms.gle/iBdRt1kPfWqgHbQu9")!)
                    // レビュー
                    Link(destination: URL(string: "https://apps.apple.com/jp/app/%E9%9B%BB%E5%A4%A7%E3%82%A2%E3%83%97%E3%83%AA/id6736813745")!) {
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("レビューのお願い")
                                .foregroundStyle(.black)
                        }
                    }
                }
                Section("アプリ情報") {
                    // バージョン情報
                    TextSection(iconname: "info.circle.fill", iconColor: .green, title: "バージョン", subtitle: "\(appVersion)")
                    // プライバシーポリシー
                    WebSection(iconname: "shield.fill", iconColor: .purple, title: "プライバシーポリシー", url: URL(string: "https://docs.google.com/document/d/e/2PACX-1vSU7JrgmGIqc0YmqpyD2lXylIps2oDOGW55MqOWX-HlZ_zcbfVzDLoBLw_MikXFpTFI6XWg3L_20iF_/pub")!)
                    // 利用規約
                    WebSection(iconname: "doc.text.fill", iconColor: .gray, title: "利用規約", url: URL(string: "https://docs.google.com/document/d/e/2PACX-1vSFlItgcCX92pdjn1H0K_Gl8zQfnnJVtDLjcLkI1NbLTW1nk_1B7thTL-K5aC5Wf6ZOARNDmN1_f5dw/pub")!)
                }
            }
        }
        .background(Color(.systemGray6))
        
    }
}

#Preview {
    MyPageView()
}

extension MyPageView {
    // アプリのバージョンを取得するプロパティ
    private var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return "\(version)"
        }
        return "情報が取得できません"
    }
}
