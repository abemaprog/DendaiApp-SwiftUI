import SwiftUI

// カスタム戻るボタンのModifier
struct CustomBackButton: ViewModifier {
    var label: String
    var color: Color
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true) // デフォルトの戻るボタンを非表示
            .toolbar {
                // カスタム戻るボタン
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // 戻る動作
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left") // 戻る矢印アイコン
                            Text(label) // カスタムテキスト
                        }
                        .foregroundColor(color) // ボタンの色
                    }
                }
            }
    }
}
extension View {
    func customBackButton(label: String = "戻る", color: Color = .blue) -> some View {
        self.modifier(CustomBackButton(label: label, color: color))
    }
}
