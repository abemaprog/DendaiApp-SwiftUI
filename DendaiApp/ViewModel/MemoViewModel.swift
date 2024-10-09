//
//  MemoViewModel.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/09.
//

import SwiftUI

class MemoViewModel: ObservableObject {
    @Published var memoItems: [MemoItem] = [] {
        didSet {
            // メモが変更されたら自動で保存
            UserDefaults.saveMemos(memoItems)
        }
    }
    init() {
        // アプリ起動時にメモをロード
        memoItems = UserDefaults.loadMemos()
    }
    
    // 新しいメモを追加
    func addMemo(content: String) {
        let newMemo = MemoItem(content: content)
        memoItems.append(newMemo)
    }
    
    // メモを削除
    func deleteMemo(at indexSet: IndexSet) {
        memoItems.remove(atOffsets: indexSet)
    }
    
    // メモを更新
    func updateMemo(id: UUID, newContent: String) {
        if let index = memoItems.firstIndex(where: { $0.id == id }) {
            memoItems[index].content = newContent
        }
    }
    // メモの順番を変更
    func moveMemo(from source: IndexSet, to destination: Int) {
        memoItems.move(fromOffsets: source, toOffset: destination)
    }
}

