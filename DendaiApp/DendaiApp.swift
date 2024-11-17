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
            SplashView()
        }
    }
}
