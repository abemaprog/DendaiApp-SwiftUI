import SwiftUI

struct LinkView: View {
    // ViewModelのインスタンスを保持
    @ObservedObject var linkVM = LinkViewModel()
    
    var body: some View {
        VStack {
            // ヘッダー
            header
            
            // サイトを表示
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(linkVM.linkItems) { link in
                        LinkRow(link: link)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    LinkView()
}

extension LinkView {
    private var header: some View {
        Text("Links")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.cyan))
    }
}
