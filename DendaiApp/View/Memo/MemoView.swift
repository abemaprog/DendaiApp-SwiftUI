import SwiftUI

struct MemoView: View {
    @StateObject private var memoVM = MemoViewModel()
    @State private var newMemoContent = ""
    
    @FocusState private var textFieldFocused: Bool
    
    var body: some View {
        NavigationView {
            
            VStack {
                // ヘッダー
                CustomHeader(label: "Memo")
                Spacer().frame(height: 20)
                // メモの追加フォーム
                addMemo
                Spacer().frame(height: 20)
                // メモのリスト表示
                memoList
            }
            
        }
    }
}

#Preview {
    MemoView()
}

extension MemoView {
    private var addMemo: some View {
        HStack {
            TextField("メモを追加", text: $newMemoContent)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading)
                .focused($textFieldFocused)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            textFieldFocused = false // Dismiss the keyboard
                        }
                    }
                }
            
            Button(action: {
                guard !newMemoContent.isEmpty else { return }
                memoVM.addMemo(content: newMemoContent)
                newMemoContent = "" // 追加後にテキストフィールドをクリア
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
            }
            .padding(.trailing)
        }
    }
    
    private var memoList: some View {
        List {
            ForEach(memoVM.memoItems) { memo in
                NavigationLink(destination: MemoEditView(memo: memo, memoVM: memoVM)) {
                    Text(memo.content)
                }
            }
            .onDelete(perform: memoVM.deleteMemo) // スワイプで削除
            .onMove(perform: memoVM.moveMemo)     // 並べ替え
            .moveDisabled(false)                 // 常に並べ替えを可能に
        }
        
        .listStyle(PlainListStyle())
    }
}
