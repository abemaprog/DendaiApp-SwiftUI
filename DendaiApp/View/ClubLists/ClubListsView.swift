import SwiftUI

struct ClubListsView: View {
    @ObservedObject private var clubListsVM = ClubListsViewModel()
    @State private var selectedTab: Int = 0 // 0: 千住, 1: 鳩山
    
    let tabs: [String] = ["千住キャンパス", "鳩山キャンパス"]
    
    var body: some View {
        VStack(spacing: 0) {
            // ヘッダー
            header
            
            // カスタムタブ (千住キャンパス・鳩山キャンパス)
            TopTabView(list: tabs, selectedTab: $selectedTab)
            
            // 選択されたタブに応じたクラブリストの表示
            if selectedTab == 0 {
                // 千住キャンパスのクラブリスト
                senjuClubs
                
            } else {
                // 鳩山キャンパスのクラブリスト
                hatoyamaClubs
                
            }
        }
    }
}

#Preview {
    ClubListsView()
}

extension ClubListsView {
    private var header: some View {
        // ヘッダー
        Text("ClubLists")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.cyan)
    }
    private var senjuClubs: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // 委員会
                if !clubListsVM.senjuCommiteeClubs.isEmpty {
                    Text("委員会")
                        .font(.title2)
                        .bold()
                    Divider()
                    clubList(clubs: clubListsVM.senjuCommiteeClubs)
                    Divider()
                }
                
                Spacer().frame(height: 10)
                
                // 体育会各団体
                if !clubListsVM.senjuSportsClubs.isEmpty {
                    Text("体育会各団体")
                        .font(.title2)
                        .bold()
                    Divider()
                    clubList(clubs: clubListsVM.senjuSportsClubs)
                    Divider()
                }
                
                Spacer().frame(height: 10)
                
                // 文化部会団体
                if !clubListsVM.senjuCultureClubs.isEmpty {
                    Text("文化部会団体")
                        .font(.title2)
                        .bold()
                    Divider()
                    clubList(clubs: clubListsVM.senjuCultureClubs)
                    Divider()
                }
                
                Spacer().frame(height: 10)
                
                // 学術研究部会
                if !clubListsVM.senjuAcademicClubs.isEmpty {
                    Text("学術研究部会")
                        .font(.title2)
                        .bold()
                    Divider()
                    clubList(clubs: clubListsVM.senjuAcademicClubs)
                    Divider()
                }
                
                Spacer().frame(height: 10)
                
                // 有志団体
                if !clubListsVM.senjuVolunteerClubs.isEmpty {
                    Text("有志団体")
                        .font(.title2)
                        .bold()
                    Divider()
                    clubList(clubs: clubListsVM.senjuVolunteerClubs)
                    Divider()
                }
                
                Spacer().frame(height: 10)
                
                // 工学部第二部
                if !clubListsVM.senjuEngineeringClubs.isEmpty {
                    Text("工学部第二部")
                        .font(.title2)
                        .bold()
                    Divider()
                    clubList(clubs: clubListsVM.senjuEngineeringClubs)
                    Divider()
                }
                
                Spacer().frame(height: 10)
                
            }
            .padding()
        }
    }
    private var hatoyamaClubs: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // 委員会
                if !clubListsVM.hatoyamaCommiteeClubs.isEmpty {
                    Text("委員会")
                        .font(.title2)
                        .bold()
                    Divider()
                    clubList(clubs: clubListsVM.hatoyamaCommiteeClubs)
                    Divider()
                }
                
                Spacer().frame(height: 10)
                
                // 体育会各団体
                if !clubListsVM.hatoyamaSportsClubs.isEmpty {
                    Text("体育会各団体")
                        .font(.title2)
                        .bold()
                    Divider()
                    clubList(clubs: clubListsVM.hatoyamaSportsClubs)
                    Divider()
                }
                
                Spacer().frame(height: 10)
                
                // 学術文化部会
                if !clubListsVM.hatoyamaAcademicClubs.isEmpty {
                    Text("学術文化部会")
                        .font(.title2)
                        .bold()
                    Divider()
                    clubList(clubs: clubListsVM.hatoyamaAcademicClubs)
                    Divider()
                }
                
                Spacer().frame(height: 10)
                
            }
            .padding()
        }
    }
    
    // クラブリスト表示関数
    private func clubList(clubs: [ClubListItem]) -> some View {
        VStack(spacing: 16) {
            ForEach(clubs) { club in
                // URLが空文字列か無効な場合はリンクを作らない
                if !club.url.isEmpty, let url = URL(string: club.url) {
                    Link(destination: url) {
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
                } else {
                    // リンクがない場合はテキストのみ表示
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
    }
}
