//
//  ClubListItem.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/09.
//

import Foundation

enum ClubCategory: String, CaseIterable {
    case committee = "委員会"
    case sports = "体育会各団体"
    case culture = "文化部会団体"
    case academic = "学術研究部会"
    case engineering = "工学部第二部"
}

enum Campus {
    case senju
    case hatoyama
}

struct ClubListItem: Identifiable {
    let id = UUID() // 一意なID
    let name: String // 部活動名
    let url: String // リンク先URL
    let category: ClubCategory // クラブのカテゴリ
    let campus: Campus // キャンパス (千住 or 鳩山)
    
}


