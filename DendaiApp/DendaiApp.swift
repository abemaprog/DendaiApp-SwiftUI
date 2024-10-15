//
//  DendaiAppApp.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/10/08.
//

import SwiftUI

@main
struct DendaiApp: App {
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView()
                    .onAppear {
                        // 2.5秒後にスプラッシュ画面を非表示にして ContentView に遷移
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}
