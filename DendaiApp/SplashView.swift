//
//  SplashView.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/11.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isSplashActive: Bool = true
    @State private var showProgress: Bool = false
    @State private var opacity: Double = 1.0
    
    var body: some View {
        ZStack {
            if showProgress {
                // ProgressView表示中
                ProgressView()
                    .font(.title)
                    .progressViewStyle(CircularProgressViewStyle())
            } else if !isSplashActive {
                // 次の画面（仮にMainView）に遷移
                ContentView()
            } else {
                // スプラッシュ画面
                Image("splash")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(opacity) // 透明度をバインド
                    .onAppear {
                        // 1秒遅らせてフェードアウト開始
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.easeOut(duration: 1.0)) {
                                opacity = 0.0
                            }
                            // フェードアウト後にProgressViewを表示
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                isSplashActive = false
                                showProgress = true
                                
                                // ProgressViewを1.5秒表示後にContentViewに遷移
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showProgress = false
                                }
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    SplashView()
}
