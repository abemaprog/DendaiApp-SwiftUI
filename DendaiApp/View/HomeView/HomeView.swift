import SwiftUI

struct HomeView: View {
    @ObservedObject var homeVM = HomeViewModel()
    @AppStorage("selectedDepartment") var selectedDepartment: String = "学部"
    @State private var selectedLecture: HomeItem? = nil // 編集する講義
    @FocusState private var textFieldFocused: Bool

    let weekdays = ["月", "火", "水", "木", "金", "土"]
    let periods = 1...7
    let departments = [
        ("学部", [("9:20", "11:00"), ("11:10", "12:50"), ("13:40", "15:20"), ("15:30", "17:10"), ("17:20", "19:00"), ("", ""), ("", "")]),
        ("大学院", [("9:20", "11:00"), ("11:10", "12:50"), ("13:40", "15:20"), ("15:30", "17:10"), ("18:00", "19:40"), ("19:50", "21:30"), ("", "")]),
        ("工学部第二部", [("9:00", "10:30"), ("10:40", "12:10"), ("13:10", "14:40"), ("14:50", "16:20"), ("16:30", "18:00"), ("18:10", "19:40"), ("19:50", "21:20")]),
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // ヘッダー
                HomeCustomHeader(
                    selectedDepartment: $selectedDepartment,
                    departments: departments,
                    label: "Home"
                )
                
                ScrollView {
                    Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                        // 曜日ヘッダー
                        Weekday(weekdays: weekdays)
                        
                        // 各時限ごとに表示
                        ForEach(Array(zip(periods, getTimes(for: selectedDepartment))), id: \.0) { (period, time) in
                            TimeTable(
                                period: period,
                                startTime: time.0,
                                endTime: time.1,
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
                                            day: day, 
                                            time: "\(time.0) - \(time.1)"
                                        )
                                    }
                                })
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                            )
                        }
                    }
                    
                    Spacer().frame(height: 30)
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
            .onTapGesture {
                textFieldFocused = false
            }
        }
        
    }
    private func getTimes(for department: String) -> [(String, String)] {
        departments.first(where: { $0.0 == department })?.1 ?? []
    }
}

#Preview {
    ContentView()
}

