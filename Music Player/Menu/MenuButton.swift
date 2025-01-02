//
//  MenuButton.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/26.
//

import SwiftUI

struct MenuButton: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .offset(y: 420)
            
            HStack(spacing: 0) {
                Button(action: { // 按鈕（首頁）
                    appState.showHomePageView = true
                    appState.showSearchView = false
                    appState.showMusicLibraryView = false
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                        Text("首頁")
                            .font(.system(size: 12))
                            .padding(.vertical, 5)
                            .foregroundColor(.white)
                    }
                    .frame(width: 100)
                }
                Button(action: { // 按鈕（搜尋）
                    appState.showHomePageView = false
                    appState.showSearchView = true
                    appState.showMusicLibraryView = false
                }) {
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                        Text("搜尋")
                            .font(.system(size: 12))
                            .padding(.vertical, 5)
                            .foregroundColor(.white)
                    }
                    .frame(width: 100)
                }
                Button(action: { // 按鈕（你的音樂庫）
                    appState.showHomePageView = false
                    appState.showSearchView = false
                    appState.showMusicLibraryView = true
                }) {
                    VStack {
                        Image(systemName: "books.vertical")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                        Text("你的音樂庫")
                            .font(.system(size: 12))
                            .padding(.vertical, 5)
                            .foregroundColor(.white)
                    }
                    .frame(width: 100)
                }
                Button(action: { // 按鈕（建立）
                    appState.showCreationView = true
                }) {
                    VStack {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                        Text("建立")
                            .font(.system(size: 12))
                            .padding(.vertical, 5)
                            .foregroundColor(.white)
                    }
                    .frame(width: 100)
                }
            }
            .offset(y: 370)
        }
    }
}

#Preview {
    MenuButton()
        .environment(AppState())
}
