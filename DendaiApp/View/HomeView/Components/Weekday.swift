//
//  Weekday.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/12/01.
//

import SwiftUI

struct Weekday: View {
    
    let weekdays: [String]
    
    var body: some View {
        GridRow {
            Text("") // 空白セル
                .frame(width: 10, height: 20)
            ForEach(weekdays, id: \.self) { day in
                Text(day)
                    .font(.footnote)
                    .bold()
                    .frame(width: 60, height: 20)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
