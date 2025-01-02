//
//  MusicView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/25.
//

import SwiftUI

struct MusicView: View { // (未完成)
    @Environment(AppState.self) private var appState
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text("MusicView").foregroundStyle(.white)
            if appState.showHomePageButton {
                HomePageButton()
            }
        }
    }
}

#Preview {
    MusicView()
        .environment(AppState())
}
