import SwiftUI

struct EditLectureView: View {
    @StateObject var homeVM: HomeViewModel
    @FocusState private var textFieldFocused: Bool
    
    var selectedDay: String? = nil      // 追加する曜日
    var selectedLecture: HomeItem? = nil // 編集する講義
    
    @Environment(\.dismiss) var dismiss
    @State private var lectureName: String = ""
    @State private var period: Int = 1
    @State private var room: String = ""
    @State private var time: String = ""
    
    @State private var selected: Int = 0
    
    let times: [(String, [String])] = [
        ("学部", ["9:20 - 11:00", "11:10 - 12:50", "13:40 - 15:20", "15:30 - 17:10", "17:20 - 19:00"]),
        ("大学院", ["9:20 - 11:00", "11:10 - 12:50", "13:40 - 15:20", "15:30 - 17:10", "18:00 - 19:40", "19:50 - 21:30"]),
        ("工学部第二部", ["9:00 - 10:30", "10:40 - 12:10", "13:10 - 14:40", "14:50 - 16:20", "16:30 - 18:00", "18:10 - 19:40", "19:50 - 21:20"]),
        
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // ヘッダー
            header
            // フォーム部分
            form
        }
    }
}

#Preview {
    EditLectureView(homeVM: HomeViewModel(), selectedDay: "月曜日")
}

extension EditLectureView {
    // ヘッダー
    private var header: some View {
        Text(selectedLecture != nil ? "講義の編集" : "\(selectedDay ?? "")の講義追加")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.cyan)
    }
    // フォームの部分
    private var form: some View {
        Form {
            Section(header: Text("講義情報を入力")) {
                TextField("講義名", text: $lectureName)
                    .focused($textFieldFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            //キーボードを閉じる
                            Button("Done") {
                                textFieldFocused = false
                            }
                        }
                    }
                Picker("時限", selection: $period) {
                    ForEach(1..<8) {
                        Text("\($0)限").tag($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                TextField("教室", text: $room)
                    .focused($textFieldFocused)
                
                Picker("時間", selection: $time) {
                    ForEach(times, id: \.0) { category, timeList in
                        // セクションラベル（タップ不可）
                        Text(category)
                            .font(.headline)
                            .foregroundColor(.gray)
                            .selectionDisabled(true)
                        // 各時間を表示
                        ForEach(timeList, id: \.self) { time in
                            Text(time).tag(time)
                        }
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            Button("保存") {
                if let lecture = selectedLecture {
                    // 既存の講義を編集
                    homeVM.editLecture(item: lecture, lectureName: lectureName, period: period, room: room, time: time)
                } else if let day = selectedDay {
                    // 新規講義を追加
                    homeVM.addLecture(lectureName: lectureName, period: period, room: room, day: day, time: time)
                }
                dismiss()
            }
            .foregroundStyle(.blue)
            
            
            // 編集モードの場合、削除ボタンを表示
            if let lecture = selectedLecture {
                Section {
                    Button(action: {
                        homeVM.deleteLecture(item: lecture)  // 講義を削除
                        dismiss()  // モーダルを閉じる
                    }) {
                        Text("削除")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .background(Color.clear)
        .onAppear {
            if let lecture = selectedLecture {
                // 編集する講義の情報を初期化
                lectureName = lecture.lectureName
                period = lecture.period
                room = lecture.room
                time = lecture.time
            }
        }
    }
}
