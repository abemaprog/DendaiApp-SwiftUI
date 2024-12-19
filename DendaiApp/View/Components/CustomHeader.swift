//
//  CustomHeader.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/11/17.
//

import SwiftUI

struct CustomHeader: View {
    let label: String
    
    
    var body: some View {
        Text(label)
            .font(.title3)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(Color.cyan)
    }
}

#Preview {
    CustomHeader(label: "ヘッダー")
}
