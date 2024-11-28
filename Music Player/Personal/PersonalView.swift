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
                VStack(alignment: .leading, spacing: 30) {
                    Button(action: { // 檢視個人檔案
                        
                    }) {
                        HStack(spacing: 10) {
                            ZStack {
                                Circle()
                                    .foregroundStyle(Color.blue)
                                    .frame(width: 50, height: 50)
                                Text("Z")
                                    .foregroundStyle(Color.black)
                            }
                            VStack(alignment: .leading) {
                                Text("Zi-Xiang Weng")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundStyle(.white)
                                Text("檢視個人檔案")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            }.frame(width: 150)
                        }
                    }
                    Divider()
                        .background(.gray)
                        .offset(x: -10)
                    Button(action: { // 新增帳戶
                        
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.white)
                            Text("新增帳戶")
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                        }
                    }
                    Button(action: { // 新內容
                        
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "flask")
                                .foregroundColor(.white)
                            Text("新內容")
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                        }
                    }
                    Button(action: { // 最近播放
                        
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                                .foregroundColor(.white)
                            Text("最近播放")
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                        }
                    }
                    Button(action: { // 設定與隱私權
                        
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "gearshape")
                                .foregroundColor(.white)
                            Text("設定與隱私權")
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                }
                .offset(x: 10, y: 80)
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
        .offset(x: 400)
}
