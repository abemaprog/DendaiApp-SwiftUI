//
//  TimeTable.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/12/01.
//

import SwiftUI

struct TimeTable: View {
    let period: Int
    let weekdays: [String]
    let lectureItems: [HomeItem]
    let onLectureTap: (HomeItem?, String) -> Void
    
    var body: some View {
        GridRow {
            // 時限列
            Text("\(period)")
                .font(.caption2)
                .bold()
                .frame(width: 10, height: 90)
            
            // 各曜日の講義を表示
            ForEach(weekdays, id: \.self) { day in
                let lecture = lectureItems.first(where: { $0.day == day && $0.period == period })
                Button {
                    onLectureTap(lecture, day)
                } label: {
                    VStack {
                        Spacer()
                        if let lecture = lecture {
                            Text(lecture.lectureName)
                                .font(.caption)
                                .lineLimit(3)
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Text(lecture.room.isEmpty ? "未設定" : lecture.room)
                                .font(.caption2)
                                .foregroundStyle(.black)
                                .frame(width: 50)
                                .lineLimit(1)
                                .background(Color.white)
                                .padding(1)
                                .padding(.bottom, 3)
                        }
                    }
                    .frame(width: 60, height: 90)
                    .background(lecture == nil ? Color.white : Color.cyan.opacity(0.3))
                    .cornerRadius(4)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .overlay(
            Rectangle()
                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
        )
    }
}
#Preview {
    ContentView()
}

