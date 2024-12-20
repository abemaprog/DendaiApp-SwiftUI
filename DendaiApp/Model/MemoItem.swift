//
//  MemoItem.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/09.
//

import Foundation

struct MemoItem: Identifiable, Codable {
    let id: UUID
    var content: String
    
    init(id: UUID = UUID(), content: String) {
        self.id = id
        self.content = content
    }
}


