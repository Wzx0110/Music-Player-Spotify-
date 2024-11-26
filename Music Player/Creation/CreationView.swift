//
//  CreationView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/26.
//

import SwiftUI

struct CreationView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        // 使用 GeometryReader 動態設置側邊欄的寬度
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("CreationView")
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
            }
            .frame(width: 400, height: 300)
            .background(Color(red: 0.122, green: 0.122, blue: 0.122))
            .offset(y: appState.showCreationView ? 650 : geometry.size.height + appState.dragOffset.height) // 控制側邊欄滑動
            .gesture( // 控制側邊欄關閉
                DragGesture()
                    .onEnded { value in
                        withAnimation {
                            appState.showCreationView = false
                        }
                    }
            )
            .animation(.easeInOut(duration: 0.3), value: appState.showCreationView)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CreationView()
        .environment(AppState())
}
