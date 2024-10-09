//
//  MemoItem.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/09.
//

import Foundation

struct MemoItem: Identifiable, Codable {
    let id = UUID()
    var content: String
}

// UserDefaultsを使ってメモを保存
extension UserDefaults {
    private static let memoKey = "memoItems"
    
    // メモを保存する
    static func saveMemos(_ memos: [MemoItem]) {
        if let data = try? JSONEncoder().encode(memos) {
            UserDefaults.standard.set(data, forKey: memoKey)
        }
    }
    
    // 保存されたメモを読み込む
    static func loadMemos() -> [MemoItem] {
        if let data = UserDefaults.standard.data(forKey: memoKey),
           let memos = try? JSONDecoder().decode([MemoItem].self, from: data) {
            return memos
        }
        return []
    }
}
