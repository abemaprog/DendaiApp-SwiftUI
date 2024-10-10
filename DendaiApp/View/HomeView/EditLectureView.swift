import SwiftUI

struct EditLectureView: View {
    @ObservedObject var homeVM: HomeViewModel
    @Environment(\.dismiss) var dismiss  // モーダルを閉じるための環境変数
    @State private var lectureName: String = ""
    @State private var period: Int = 1
    @State private var room: String = ""
    
    var body: some View {
        NavigationView {
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
                
                Button("保存") {
                    homeVM.addLecture(lectureName: lectureName, period: period, room: room)
                    dismiss()  // 講義追加後にモーダルを閉じる
                }
            }
            .navigationTitle("講義の追加")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("キャンセル") {
                        dismiss() // キャンセル時にモーダルを閉じる
                    }
                }
            }
        }
    }
}

#Preview {
    EditLectureView(homeVM: HomeViewModel())
}
