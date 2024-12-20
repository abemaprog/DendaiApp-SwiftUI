//
//  TopTabView.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/10.
//

import SwiftUI

struct TopTabView: View {
    let list: [String]
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< list.count, id: \.self) { index in
                Button(action: {
                    withAnimation {
                        selectedTab = index
                    }
                }) {
                    VStack(spacing: 0) {
                        HStack {
                            Text(list[index])
                                .font(Font.system(size: 18, weight: .semibold))
                                .foregroundColor(Color.primary)
                        }
                        .frame(
                            width: UIScreen.main.bounds.width / CGFloat(list.count),
                            height: 48 - 3
                        )
                        Rectangle()
                            .fill(selectedTab == index ? Color.cyan : Color.clear)
                            .frame(height: 3)
                    }
                    .fixedSize()
                }
            }
        }
        .frame(height: 48)
        .background(Color.white)
    }
}
