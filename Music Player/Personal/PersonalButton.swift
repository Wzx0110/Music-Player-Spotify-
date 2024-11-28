//
//  PersonalButton.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/25.
//

import SwiftUI


struct PersonalButton: View {
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        Button(action: {
            appState.showPersonalView = true
        }) {
            ZStack {
                Circle()
                    .foregroundStyle(Color.blue)
                    .frame(width: 40, height: 40)
                Text("Z")
                    .foregroundStyle(Color.black)
            }
        }
        .offset(x:-170, y: -330)
    }
}


#Preview {
    PersonalButton()
        .environment(AppState())
}



