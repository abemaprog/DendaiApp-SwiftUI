import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    @State private var expandedDays: [String: Bool] = [:]  // 曜日ごとのトグル状態を管理
    @State private var selectedLecture: HomeItem? = nil // 編集する講義
    @State private var selectedDay: String? = nil // 講義を追加する曜日
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // ヘッダー
                CustomHeader(label: "Home")
                
                // テキスト「時間割」の表示
                displayTitle
                
                // 各曜日ごとの講義を表示する
                displayLecture
            }
        }
        .tint(.black)
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    // テキスト「時間割の表示」
    private var displayTitle: some View {
        VStack(alignment: .leading) {
                Text("時間割")
                    .font(.title3)
                    .bold()
                    .padding()
                
            Divider()
            Spacer().frame(height:10)
        }
    }
    private var displayLecture: some View {
        ScrollView {
            ForEach(weekdays, id: \.self) { day in
                VStack {
                    // 曜日のヘッダー
                    dayHeader(day: day)
                    
                    // 開いた場合、該当曜日の講義を表示
                    if expandedDays[day] == true {
                        // 特定の曜日の講義を表示（昇順でソート）
                        ForEach(homeVM.lectureItems
                            .filter { $0.day == day }   // 曜日でフィルタ
                            .sorted { $0.period < $1.period }  // 時限で昇順にソート
                        ) { lecture in
                            NavigationLink(destination: EditLectureView(homeVM: homeVM, selectedLecture: lecture)) {
                                LectureRow(lecture: lecture)
                            }
                        }
                        .padding(.horizontal)
                        
                        // 追加ボタンを表示
                        addLectureButton(for: day)
                    }
                }
            }
        }
    }
    
    // 曜日のヘッダー
    private func dayHeader(day: String) -> some View {
        Button(action: {
            // 曜日の開閉状態をトグル
            expandedDays[day] = !(expandedDays[day] ?? false)
        }) {
            HStack {
                Text(day)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                Spacer()
                Image(systemName: (expandedDays[day] ?? false) ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
        }
    }
    
    // 追加ボタンを表示
    private func addLectureButton(for day: String) -> some View {
        NavigationLink(destination: EditLectureView(homeVM: homeVM, selectedDay: day)) {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 13))
                    Text("\(day)に講義を追加")
                        .fontWeight(.bold)
                }
                .foregroundColor(.blue)
                .padding(.horizontal)
            }
            .padding()
        }
    }
    // 曜日のリスト
    private var weekdays: [String] {
        ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]
    }

}
