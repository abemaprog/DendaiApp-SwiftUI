//
//  HomeItem.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/10.
//

import Foundation

struct HomeItem: Identifiable, Codable {
    let id = UUID()  // ユニークなID
    var lectureName: String  // 講義名
    var period: Int  // 時限 (1〜7限)
    var room: String // 教室
    var day: String  // 曜日（"月曜日" など）
}


