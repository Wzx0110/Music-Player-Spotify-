//
//  PersonalView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/26.
//

import SwiftUI

struct PersonalView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        // 使用 GeometryReader 動態設置側邊欄的寬度
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("PersonalView")
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
            }
            .frame(width: 350)
            .background(Color(red: 0.122, green: 0.122, blue: 0.122))
            .offset(x: appState.showPersonalView ? 0 : -geometry.size.width + appState.dragOffset.width) // 控制側邊欄滑動
            .gesture( // 控制側邊欄關閉
                DragGesture()
                    .onEnded { value in
                        withAnimation {
                            appState.showPersonalView = false
                        }
                    }
            )
            .animation(.easeInOut(duration: 0.3), value: appState.showPersonalView)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    PersonalView()
        .environment(AppState())
}
