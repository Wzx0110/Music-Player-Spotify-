//
//  HomePageButton.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/25.
//
import SwiftUI

struct HomePageButton: View {
    @Environment(AppState.self) private var appState
    var body: some View {
        HStack {
            Button(action: { // 按鈕（所有）
                appState.showAllView = true
                appState.showMusicView = false
                appState.showPodcastView = false
            }) {
                Text("所有")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Capsule().fill(appState.showAllView ? Color.green : Color(red: 0.122, green: 0.122, blue: 0.122)))
                    .foregroundColor(appState.showAllView ? Color.black : Color.white)
            }
            Button(action: { // 按鈕（音樂）
                appState.showAllView = false
                appState.showMusicView = true
                appState.showPodcastView = false
            }) {
                
                Text("音樂")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Capsule().fill(appState.showMusicView ? Color.green : Color(red: 0.122, green: 0.122, blue: 0.122)))
                    .foregroundColor(appState.showMusicView ? Color.black : Color.white)
            }
            Button(action: { // 按鈕（Podcast）
                appState.showAllView = false
                appState.showMusicView = false
                appState.showPodcastView = true

            }) {
                Text("Podcast")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Capsule().fill(appState.showPodcastView ? Color.green : Color(red: 0.122, green: 0.122, blue: 0.122)))
                    .foregroundColor(appState.showPodcastView ? Color.black : Color.white)
            }
        }
        .offset(x:-20, y: -330)
    }

    
}

#Preview {
    HomePageButton()
        .environment(AppState())
}
