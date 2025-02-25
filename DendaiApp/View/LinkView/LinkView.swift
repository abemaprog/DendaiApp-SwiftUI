import SwiftUI

struct LinkView: View {
    // ViewModelのインスタンスを保持
    @ObservedObject var linkVM = LinkViewModel()
    
    var body: some View {
        VStack {
            // ヘッダー
            CustomHeader(label: "Links")
            // サイトを表示
            ScrollView {
                // title(大学サイト)
                VStack(alignment: .leading) {
                    Text("大学サイト")
                        .font(.title3)
                        .bold()
                        .padding()
                    Divider()
                }
                
                // webサイトを表示
                VStack(spacing: 16) {
                    ForEach(linkVM.linkItems) { link in
                        LinkRow(link: link)
                    }
                    Divider()
                }
                .padding()
                
                // title2(その他)
                VStack(alignment: .leading) {
                    Text("その他")
                        .font(.title3)
                        .bold()
                        .padding()
                    Divider()
                }
                // webサイトを表示
                VStack(spacing: 16) {
                    ForEach(linkVM.otherLinkItems) { link in
                        LinkRow(link: link)
                    }
                    Divider()
                }
                .padding()
            }
        }
    }
}

#Preview {
    LinkView()
}
