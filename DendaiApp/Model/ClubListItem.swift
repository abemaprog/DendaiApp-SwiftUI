//
//  ClubListItem.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/09.
//

import Foundation


struct ClubListItem: Identifiable {
    let id = UUID() // 一意なID
    let name: String // 部活動名
    let url: String // リンク先URL
    
}


