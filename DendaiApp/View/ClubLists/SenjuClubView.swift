import SwiftUI

struct SenjuClubView: View {
    @ObservedObject var clubListsVM: ClubListsViewModel // ViewModelを参照
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("部活・サークル")
                        .padding()
                    Divider()
                }
                VStack(spacing: 16) {
                    ForEach(clubListsVM.senjuClubs) { club in
                        Link(destination: URL(string: club.url)!) {
                            HStack {
                                Text(club.name)
                                    .font(.headline)
                                    .foregroundColor(.black) // リンクカラー
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
    }
}

#Preview {
    SenjuClubView(clubListsVM: ClubListsViewModel())
}
