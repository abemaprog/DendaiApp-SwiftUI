//
//  WebSection.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/11/23.
//
import SwiftUI
import WebUI

struct WebSection: View {
    
    @State private var isWebPresented = false
    
    let iconname: String
    let iconColor: Color
    let title: String
    //let subtitle: String
    let url: URL
    
    var body: some View {
        Button {
            isWebPresented.toggle()
        } label: {
            HStack {
                Image(systemName: iconname)
                    .foregroundStyle(iconColor)
                
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Spacer()
                
                
                Image(systemName: "chevron.forward")
                    .foregroundColor(.gray)
                
            }
        }
        .sheet(isPresented: $isWebPresented) {
            NavigationStack {
                WebView(request: URLRequest(url: url))
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("閉じる") {
                                isWebPresented = false
                            }
                        }
                    }
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    WebSection(iconname: "person", iconColor: .red, title: "タイトル", url: URL(string: "https://www.example.com")!)
}
