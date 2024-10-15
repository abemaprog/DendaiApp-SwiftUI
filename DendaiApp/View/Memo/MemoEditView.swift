//
//  MemoEditView.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/09.
//

import SwiftUI

struct MemoEditView: View {
    @State var memo: MemoItem
    @StateObject var memoVM: MemoViewModel
    @State private var updatedContent = ""
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var textFieldFocused: Bool
    
    var body: some View {
        VStack {
            // ヘッダー
            header
            
            // メモの編集フォーム
            TextField("メモ内容を編集", text: $updatedContent)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
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
            
            // 保存ボタン
            saveButton
            
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
        Text("メモの編集")
            .font(.title3)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.cyan)
    }
    
    private var saveButton: some View {
        Button(action: {
            // メモ内容を保存する処理
            memoVM.updateMemo(id: memo.id, newContent: updatedContent)
            dismiss()  // 保存後、ビューを閉じる
        }) {
            Text("保存")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
    }
}


