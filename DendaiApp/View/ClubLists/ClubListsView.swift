import SwiftUI

struct ClubListsView: View {
    @StateObject private var clubListsVM = ClubListsViewModel()
    @State private var selectedTab: Int = 0 // 0: 千住, 1: 鳩山
    @FocusState private var textFieldFocused: Bool
    
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
        .onTapGesture {
            textFieldFocused = false
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
    
    private var searchBar: some View {
        VStack(alignment: .leading) {
            Text("部活・サークルの検索")
                .font(.title3)
                .bold()
            
            HStack {
                TextField("部活・サークル名を入力", text: $clubListsVM.searchText)
                    .padding(8)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 0.4)
                    )
                    .focused($textFieldFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                textFieldFocused = false //　キーボードを閉じる
                            }
                        }
                    }
            }
            
            Spacer().frame(height: 10)
        }
    }
    
    private var senjuClubs: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                //検索バー
                searchBar
                
                // 委員会
                if !clubListsVM.senjuCommiteeClubs.isEmpty {
                    if !clubListsVM.filteredClubs(for: clubListsVM.senjuCommiteeClubs).isEmpty {
                        Text("委員会")
                            .font(.title2)
                            .bold()
                        Divider()
                        clubList(clubs: clubListsVM.filteredClubs(for: clubListsVM.senjuCommiteeClubs))
                        Divider()
                    }
                }
                
                Spacer().frame(height: 10)
                
                // 体育会各団体
                if !clubListsVM.senjuSportsClubs.isEmpty {
                    if !clubListsVM.filteredClubs(for: clubListsVM.senjuSportsClubs).isEmpty {
                        Text("体育会各団体")
                            .font(.title2)
                            .bold()
                        Divider()
                        clubList(clubs: clubListsVM.filteredClubs(for: clubListsVM.senjuSportsClubs))
                        Divider()
                    }
                }
                
                Spacer().frame(height: 10)
                
                // 文化部会団体
                if !clubListsVM.senjuCultureClubs.isEmpty {
                    if !clubListsVM.filteredClubs(for: clubListsVM.senjuCultureClubs).isEmpty {
                        Text("文化部会団体")
                            .font(.title2)
                            .bold()
                        Divider()
                        clubList(clubs: clubListsVM.filteredClubs(for: clubListsVM.senjuCultureClubs))
                        Divider()
                    }
                }
                
                Spacer().frame(height: 10)
                
                // 学術研究部会
                if !clubListsVM.senjuAcademicClubs.isEmpty {
                    if !clubListsVM.filteredClubs(for: clubListsVM.senjuAcademicClubs).isEmpty {
                        Text("学術研究部会")
                            .font(.title2)
                            .bold()
                        Divider()
                        clubList(clubs: clubListsVM.filteredClubs(for: clubListsVM.senjuAcademicClubs))
                        Divider()
                    }
                }
                
                Spacer().frame(height: 10)
                
                // 有志団体
                if !clubListsVM.senjuVolunteerClubs.isEmpty {
                    if !clubListsVM.filteredClubs(for: clubListsVM.senjuVolunteerClubs).isEmpty {
                        Text("有志団体")
                            .font(.title2)
                            .bold()
                        Divider()
                        clubList(clubs: clubListsVM.filteredClubs(for: clubListsVM.senjuVolunteerClubs))
                        Divider()
                    }
                }
                
                Spacer().frame(height: 10)
                
                // 工学部第二部
                if !clubListsVM.senjuEngineeringClubs.isEmpty {
                    if !clubListsVM.filteredClubs(for: clubListsVM.senjuEngineeringClubs).isEmpty {
                        Text("工学部第二部")
                            .font(.title2)
                            .bold()
                        Divider()
                        clubList(clubs: clubListsVM.filteredClubs(for: clubListsVM.senjuEngineeringClubs))
                        Divider()
                    }
                }
                
                Spacer().frame(height: 10)
                
            }
            .padding()
        }
    }
    private var hatoyamaClubs: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                //検索バー
                searchBar
                
                // 委員会
                if !clubListsVM.hatoyamaCommiteeClubs.isEmpty {
                    if !clubListsVM.filteredClubs(for: clubListsVM.hatoyamaCommiteeClubs).isEmpty {
                        Text("委員会")
                            .font(.title2)
                            .bold()
                        Divider()
                        clubList(clubs: clubListsVM.filteredClubs(for: clubListsVM.hatoyamaCommiteeClubs))
                        Divider()
                    }
                }
                
                Spacer().frame(height: 10)
                
                // 体育会各団体
                if !clubListsVM.hatoyamaSportsClubs.isEmpty {
                    if !clubListsVM.filteredClubs(for: clubListsVM.hatoyamaSportsClubs).isEmpty {
                        Text("体育会各団体")
                            .font(.title2)
                            .bold()
                        Divider()
                        clubList(clubs: clubListsVM.filteredClubs(for: clubListsVM.hatoyamaSportsClubs))
                        Divider()
                    }
                }
                
                Spacer().frame(height: 10)
                
                // 学術文化部会
                if !clubListsVM.hatoyamaAcademicClubs.isEmpty {
                    if !clubListsVM.filteredClubs(for: clubListsVM.hatoyamaAcademicClubs).isEmpty {
                        Text("学術文化部会")
                            .font(.title2)
                            .bold()
                        Divider()
                        clubList(clubs: clubListsVM.filteredClubs(for: clubListsVM.hatoyamaAcademicClubs))
                        Divider()
                    }
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
