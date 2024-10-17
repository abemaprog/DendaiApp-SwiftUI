//
//  LectureRow.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/10.
//

import SwiftUI

struct LectureRow: View {
    var lecture: HomeItem
    
    var body: some View {
        HStack {
            Text("\(lecture.period)限")
                .font(.headline)
                .frame(width: 60, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text(lecture.lectureName)
                    .font(.subheadline)
                Text("教室: \(lecture.room)")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            
            Spacer()
            Text("\(lecture.time)")
                .font(.subheadline)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

#Preview {
    LectureRow(lecture: HomeItem(lectureName: "数学", period: 1, room: "A101", day: "月", time: "9:20 - 11:00"))
}
