import SwiftUI

struct LinkView: View {
    var body: some View {
        VStack {
            // ヘッダー
            Text("Links")
                .font(.title2)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6)) // 背景色
            
            // スクロール可能なコンテンツ
            ScrollView {
                VStack(spacing: 16) {
                    LinkRow(title: "University Website", systemImage: "globe", url: "https://www.youruniversity.ac.jp")
                    LinkRow(title: "Student Portal", systemImage: "person.crop.circle", url: "https://www.youruniversity.ac.jp/portal")
                    LinkRow(title: "University News", systemImage: "newspaper", url: "https://www.youruniversity.ac.jp/news")
                    
                    Divider().padding(.vertical, 10)
                    
                    LinkRow(title: "Twitter", systemImage: "bubble.left.and.bubble.right.fill", url: "https://www.twitter.com/university")
                    LinkRow(title: "Facebook", systemImage: "person.2.fill", url: "https://www.facebook.com/university")
                    LinkRow(title: "Instagram", systemImage: "camera.fill", url: "https://www.instagram.com/university")
                }
                .padding()
            }
        }
    }
}

struct LinkRow: View {
    let title: String
    let systemImage: String
    let url: String
    
    var body: some View {
        Button(action: {
            if let url = URL(string: url) {
                UIApplication.shared.open(url)
            }
        }) {
            HStack {
                Image(systemName: systemImage)
                    .font(.system(size: 24))
                    .foregroundColor(.blue)
                    .frame(width: 40, height: 40)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer() // 自動的に右端にスペースを確保
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 2)
        }
    }
}

#Preview {
    LinkView()
}
