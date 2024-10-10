//
//  MemoEditView.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/09.
//

import SwiftUI

struct MemoEditView: View {
    @State var memo: MemoItem
    @ObservedObject var memoVM: MemoViewModel
    @State private var updatedContent = ""
    
    var body: some View {
        VStack {
            // ヘッダー
            header
            
            // メモの編集フォーム
            TextField("メモ内容を編集", text: $updatedContent)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                memoVM.updateMemo(id: memo.id, newContent: updatedContent)
            }) {
                Text("保存")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            // 初期値に現在のメモ内容を設定
            updatedContent = memo.content
        }
    }
}

#Preview {
    MemoEditView(memo: MemoItem(content: "テストメモ"), memoVM: MemoViewModel())
}

extension MemoEditView {
    private var header: some View {
        Text("Memos")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.cyan))
    }
}