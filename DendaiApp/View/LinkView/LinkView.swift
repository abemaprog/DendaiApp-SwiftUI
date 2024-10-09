import SwiftUI

struct LinkView: View {
    // ViewModelのインスタンスを保持
    @ObservedObject var linkVM = LinkViewModel()
    
    var body: some View {
        VStack {
            // ヘッダー
            header
            // サイトを表示
            displayScroll
        }
    }
}

#Preview {
    LinkView()
}

extension LinkView {
    //サイト表示をスクロール
    private var displayScroll: some View {
        ScrollView {
            // title(大学サイト)
            title1
            // webサイトを表示
            displayLink1
            // title2(その他)
            title2
            // webサイトを表示
            displayLink2
        }
    }
    //ヘッダー
    private var header: some View {
        Text("Links")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.cyan))
    }
    // title1
    private var title1: some View {
        VStack(alignment: .leading) {
            Text("大学サイト")
                .bold()
                .padding()
            Divider()
        }
    }
    // webサイト表示1
    private var displayLink1: some View {
        VStack(spacing: 16) {
            ForEach(linkVM.linkItems) { link in
                LinkRow(link: link)
            }
        }
        .padding()
    }
    
    // title2
    private var title2: some View {
        VStack(alignment: .leading) {
            Text("その他")
                .bold()
                .padding()
            Divider()
        }
    }
    // webサイト表示2
    private var displayLink2: some View {
        VStack(spacing: 16) {
            ForEach(linkVM.otherLinkItems) { link in
                LinkRow(link: link)
            }
        }
        .padding()
    }
}
