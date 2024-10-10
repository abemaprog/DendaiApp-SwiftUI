import SwiftUI

struct HatoyamaClubView: View {
    @ObservedObject var clubListsVM: ClubListsViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(clubListsVM.hatoyamaClubs) { club in
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
    }
}

#Preview {
    HatoyamaClubView(clubListsVM: ClubListsViewModel())
}
