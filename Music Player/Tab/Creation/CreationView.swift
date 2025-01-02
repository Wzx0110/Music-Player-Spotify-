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
        // 使用 GeometryReader 動態設置欄高度
        GeometryReader { geometry in
            VStack {
                VStack(alignment: .leading, spacing: 30) {
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray)
                        .frame(width: 50, height:5)
                        .offset(x: 150)
                    Button(action: { // 播放清單(未完成)
                        
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "music.note")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                            
                            VStack(alignment: .leading) {
                                Text("播放清單")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(.white)
                                Text("建立收錄歌曲或單集的播放清單")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Button(action: { // 共享合輯(未完成)
                        
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "circlebadge.2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                            VStack(alignment: .leading) {
                                Text("共享合輯")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(.white)
                                Text("透過共享播放清單與好友分享喜愛的音樂")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Spacer()
                }
                .offset(x: -20, y: -60)
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.122, green: 0.122, blue: 0.122))
            .offset(y: appState.showCreationView ? 650 : geometry.size.height + appState.dragOffset.height) // 控制欄滑動
            .gesture( // 控制動態設置欄
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
        .offset(y: -200)
}
