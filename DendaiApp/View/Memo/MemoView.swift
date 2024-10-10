import SwiftUI

struct MemoView: View {
    @StateObject private var memoVM = MemoViewModel()
    @State private var newMemoContent = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // ヘッダー
                header
                Spacer().frame(height: 20)
                
                // メモの追加フォーム
                HStack {
                    TextField("メモを追加", text: $newMemoContent)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)
                    
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
                
                Spacer().frame(height: 20)
                
                // メモのリスト表示
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
        
    }
}

#Preview {
    MemoView()
}

extension MemoView {
    private var header: some View {
        Text("Memo")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.cyan))
    }
}
