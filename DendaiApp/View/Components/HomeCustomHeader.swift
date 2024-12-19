//
//  HomeCustomHeader.swift
//  DendaiApp
//
//  Created by Manato Abe on 2024/12/19.
//

import SwiftUI

struct HomeCustomHeader: View {
    @Binding var selectedDepartment: String
    let departments: [(String, [(String, String)])]
    let label: String
    
    var body: some View {
        ZStack {
            Text(label)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Color.cyan)
            HStack {
                Spacer()
                Picker("学部の選択", selection: $selectedDepartment) {
                    ForEach(departments, id: \.0) { department in
                        Text(department.0).tag(department.0)
                    }
                }
                .accentColor(.black)
                
            }
            .padding(.bottom, -10)
        }
        
    }
}

#Preview {
    HomeView()
}
