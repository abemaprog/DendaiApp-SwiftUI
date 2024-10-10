import SwiftUI

struct EditLectureView: View {
    @ObservedObject var homeVM: HomeViewModel
    var selectedDay: String? = nil      // 追加する曜日
    var selectedLecture: HomeItem? = nil // 編集する講義
    
    @Environment(\.dismiss) var dismiss
    @State private var lectureName: String = ""
    @State private var period: Int = 1
    @State private var room: String = ""
    
    var body: some View {
        VStack(spacing: 0) {  // ヘッダーとFormの間の余白をゼロにする
            // カスタムヘッダー
            header
            
            // フォーム部分
            Form {
                Section(header: Text("講義情報を入力")) {
                    TextField("講義名", text: $lectureName)
                    Picker("時限", selection: $period) {
                        ForEach(1..<8) {
                            Text("\($0)限").tag($0)
                        }
                    }
                    TextField("教室", text: $room)
                }
                
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
                
                Button("保存") {
                    if let lecture = selectedLecture {
                        // 既存の講義を編集
                        homeVM.editLecture(item: lecture, lectureName: lectureName, period: period, room: room)
                    } else if let day = selectedDay {
                        // 新規講義を追加
                        homeVM.addLecture(lectureName: lectureName, period: period, room: room, day: day)
                    }
                    dismiss()
                }
            }
            .background(Color.clear)  // Formの背景を透明にして境界線を目立たなくする
            .onAppear {
                if let lecture = selectedLecture {
                    // 編集する講義の情報を初期化
                    lectureName = lecture.lectureName
                    period = lecture.period
                    room = lecture.room
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("キャンセル") {
                    dismiss()
                }
            }
        }
    }
    
    // カスタムヘッダー
    private var header: some View {
        Text(selectedLecture != nil ? "講義の編集" : "\(selectedDay ?? "")の講義追加")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.cyan)
    }
}

#Preview {
    EditLectureView(homeVM: HomeViewModel(), selectedDay: "月曜日")
}
