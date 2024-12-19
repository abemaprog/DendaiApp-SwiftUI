//
//  TimeTable.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/12/01.
//

import SwiftUI

struct TimeTable: View {
    let period: Int
    let startTime: String
    let endTime: String
    let weekdays: [String]
    let lectureItems: [HomeItem]
    let onLectureTap: (HomeItem?, String) -> Void
    
    var body: some View {
        GridRow {
            VStack {
                Text(startTime)
                    .font(.caption2)
                    .opacity(0.8)
                    .padding(.bottom, 9)
                Text("\(period)")
                    .font(.caption2)
                    .bold()
                Text(endTime)
                    .font(.caption2)
                    .opacity(0.8)
                    .padding(.top, 9)
            }
            .frame(width: 30, height: 93)
            
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
                    .frame(width: 60, height: 93)
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

