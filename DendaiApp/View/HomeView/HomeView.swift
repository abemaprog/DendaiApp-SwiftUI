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
                        Weekday(weekdays: weekdays)
                        
                        // 各時限ごとに表示
                        ForEach(periods, id: \.self) { period in
                            TimeTable(
                                period: period,
                                weekdays: weekdays,
                                lectureItems: homeVM.lectureItems,
                                onLectureTap: { lecture, day in
                                    if let lecture = lecture {
                                        selectedLecture = lecture
                                    } else {
                                        selectedLecture = HomeItem(
                                            lectureName: "",
                                            period: period,
                                            room: "",
                                            day: day, // 渡された曜日を設定
                                            time: ""
                                        )
                                    }
                                })
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                            )
                        }
                    }
                }
            }
            .sheet(item: $selectedLecture) { lecture in
                EditLectureView(
                    homeVM: homeVM,
                    lecture: lecture
                )
                .presentationDetents([.medium])
                .presentationCornerRadius(15)
                .presentationDragIndicator(.visible)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
