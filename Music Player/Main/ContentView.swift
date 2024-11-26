//
//  ContentView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(AppState.self) private var appState
    var body: some View {
        ZStack {
            if appState.showHomePageView {
                HomePageView()
            }
            else if appState.showSearchView {
                SearchView()
            }
            else if appState.showMusicLibraryView {
                MusicLibraryView()
            }
            MenuButton()
            PersonalView()
            CreationView()
            
            
        }
    }
}

#Preview {
    ContentView()
        .environment(AppState())
}
