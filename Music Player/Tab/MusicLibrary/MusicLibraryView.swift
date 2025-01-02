//
//  MusicLibraryView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/26.
//

import SwiftUI

struct MusicLibraryView: View {
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            PersonalButton()
            Text("你的音樂庫")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .offset(x: -70, y: -330)
            Button(action: { // 按鈕（搜尋）(未完成)
                
            }) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 25, height: 25)
            }
            .offset(x: 120, y: -330)
            Button(action: { // 按鈕（建立）
                appState.showCreationView = true
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 25, height: 25)
            }
            .offset(x: 170, y: -330)
            Text("MusicLibraryView").foregroundStyle(.white)
        }
    }
}

#Preview {
    MusicLibraryView()
        .environment(AppState())
}
