//
//  SplashView.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/11.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            // 背景画像
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // 中心に配置する画像
            Image("icon")
                .resizable()
                .frame(width: 200, height: 200)
        }
        .transition(.opacity) // フェードアウトアニメーション
    }
}

#Preview {
    SplashView()
}
