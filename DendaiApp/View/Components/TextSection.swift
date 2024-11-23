//
//  TextSection.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/11/23.
//

import SwiftUI

struct TextSection: View {
    
    let iconname: String
    let iconColor: Color
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            Image(systemName: iconname)
                .foregroundStyle(iconColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
        }
    }
}

#Preview {
    TextSection(iconname: "person.fill", iconColor: .blue, title: "コンテンツ", subtitle: "1.0")
}
