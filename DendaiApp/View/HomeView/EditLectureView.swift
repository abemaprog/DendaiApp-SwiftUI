import SwiftUI

struct EditLectureView: View {
    @ObservedObject var homeVM: HomeViewModel
    @FocusState private var textFieldFocused: Bool
    
    @Environment(\.dismiss) var dismiss
    
    @State private var lectureName: String = ""
    @State private var room: String = ""
    @State private var isWebPresented = false
    @State var lecture: HomeItem
    
    var selectedDay: String? = nil      // 追加する曜日
    var selectedLecture: HomeItem? = nil // 編集する講義
    
    
    
    // 時限数のところに埋め込めるようにする
    let times: [(String, [String])] = [
        ("学部", ["9:20 - 11:00", "11:10 - 12:50", "13:40 - 15:20", "15:30 - 17:10", "17:20 - 19:00"]),
        ("大学院", ["9:20 - 11:00", "11:10 - 12:50", "13:40 - 15:20", "15:30 - 17:10", "18:00 - 19:40", "19:50 - 21:30"]),
        ("工学部第二部", ["9:00 - 10:30", "10:40 - 12:10", "13:10 - 14:40", "14:50 - 16:20", "16:30 - 18:00", "18:10 - 19:40", "19:50 - 21:20"]),
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Form {
                    Section(header: Text("\(lecture.day)曜日\(lecture.period)限の講義情報を入力")) {
                        TextField("講義名", text: $lectureName)
                            .focused($textFieldFocused)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    //キーボードをとじる
                                    Button("Done") {
                                        textFieldFocused = false
                                    }
                                }
                            }
                        TextField("教室", text: $room)
                            .focused($textFieldFocused)
                    }
                    
                    
                    Button("保存") {
                        
                        lecture.lectureName = lectureName
                        lecture.room = room
                        
                        if homeVM.lectureExists(lecture) {
                            homeVM.editLecture(lecture) // 既存の講義を編集
                        } else {
                            homeVM.addLecture(lecture) // 新しい講義を追加
                        }
                        dismiss()
                    }
                    .foregroundStyle(.cyan)
                    
                    
                    // 編集モードの場合、削除ボタンを表示
                    if homeVM.lectureExists(lecture) {
                        Button("削除") {
                            homeVM.deleteLecture(item: lecture) // 講義を削除
                            dismiss() // ビューを閉じる
                        }
                        .foregroundStyle(.red)
                    }
                }
                .background(Color.clear)
                .onAppear {
                    lectureName = lecture.lectureName
                    room = lecture.room
                    
                    if let day = selectedDay {
                        lecture.day = day
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
