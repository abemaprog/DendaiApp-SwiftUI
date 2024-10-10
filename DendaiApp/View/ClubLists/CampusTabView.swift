import SwiftUI

// クラブリストを引数として受け取る
struct CampusTabView: View {
    let clubs: [ClubListItem]
    
    var body: some View {
        // リストとして表示させる
        clubList
    }
}

#Preview {
    CampusTabView(clubs: [ClubListItem(name: "サッカー部", url: "https://example.com", category: .sports, campus: .senju)])
}

extension CampusTabView {
    private var clubList: some View {
        ScrollView {
            // クラブネームを表示
            displayClubName
        }
    }
    
    private var displayClubName: some View {
        VStack(spacing: 16) {
            ForEach(clubs) { club in
                Link(destination: URL(string: club.url)!) {
                    HStack {
                        Text(club.name)
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                }
            }
        }
        .padding()
    }
}

