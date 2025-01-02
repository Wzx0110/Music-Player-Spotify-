//
//  HomePageView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/25.
//

import SwiftUI

struct HomePageView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        ZStack {
            if appState.showAllView {
                AllView()
            }
            else if appState.showMusicView {
                MusicView()
            }
            else if appState.showPodcastView {
                PodcastView()
            }
        }
    }
}

#Preview {
    HomePageView()
        .environment(AppState())
}
