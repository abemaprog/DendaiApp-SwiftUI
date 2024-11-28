import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    @State private var selectedLecture: HomeItem? = nil // 編集する講義

    let weekdays = ["月", "火", "水", "木", "金", "土"]
    let periods = 1...7
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // ヘッダー
                CustomHeader(label: "Home")
                
                ScrollView {
                    Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                        // 曜日ヘッダー
                        GridRow {
                            Text("") // 空白セル
                                .frame(width: 30, height: 20)
                                .background(Color.gray.opacity(0.1))
                            ForEach(weekdays, id: \.self) { day in
                                Text(day)
                                    .font(.footnote)
                                    .bold()
                                    .frame(width: 60, height: 20)
                                    .background(Color.gray.opacity(0.1))
                            }
                        }
                        
                        // 各時限ごとに表示
                        ForEach(periods, id: \.self) { period in
                            GridRow {
                                // 時限列
                                Text("\(period)")
                                    .frame(width: 30, height: 90)
                                    .background(Color.gray.opacity(0.1))
                                    .bold()
                                
                                // 各曜日の講義を表示
                                ForEach(weekdays, id: \.self) { day in
                                    let lecture = homeVM.lectureItems
                                        .first(where: { $0.day == day && $0.period == period })
                                    
                                    Button {
                                        if let lecture = lecture {
                                            selectedLecture = lecture
                                        } else {
                                            // 空の講義データを作成して新規追加
                                            selectedLecture = HomeItem(
                                                lectureName: "",
                                                period: period,
                                                room: "",
                                                day: day,
                                                time: ""
                                            )
                                        }
                                        print("ボタンがタップされました")
                                    } label: {
                                        Text(lecture?.lectureName ?? "")
                                            .frame(width: 60, height: 90)
                                            .background(lecture == nil ? Color.white : Color.blue.opacity(0.3))
                                            .cornerRadius(4)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                        }
                    }
                }
            }
            .sheet(item: $selectedLecture) { lecture in
                EditLectureView(
                    homeVM: homeVM,
                    selectedLecture: lecture
                )
                .fraction(0.40)
            }
        }
        
    }
}

#Preview {
    HomeView()
}
