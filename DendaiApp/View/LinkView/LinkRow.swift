//
//  LinkRow.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/09.
//

import SwiftUI

struct LinkRow: View {
    let link: LinkItem
    
    var body: some View {
        // 外部ブラウザ（Safari）でリンクを開く
        Button(action: {
            if let url = URL(string: link.url) {
                UIApplication.shared.open(url)
            }
        }) {
            // 出力を表示する
            displayItem
        }
        
    }
}

#Preview {
    LinkRow(link: LinkItem(title: "Test", image: "link.circle", url: "https://www.example.com", color: .blue))
}

extension LinkRow {
    private var displayItem: some View {
        HStack {
            // 画像を出力
            Image(systemName: link.image)
                .font(.system(size: 24))
                .foregroundColor(link.color)
                .frame(width: 40, height: 40)
            
            // サイト名を出力
            Text(link.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
