//
//  AppState.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/25.
//

import SwiftUI

@Observable class AppState : ObservableObject{
    var showAllView: Bool = true
    var showMusicView: Bool = false
    var showPodcastView: Bool = false
    
    var showHomePageView: Bool = true
    var showSearchView: Bool = false
    var showMusicLibraryView: Bool = false
    
    var showCreationView: Bool = false
    var showPersonalView: Bool = false
    
    var dragOffset = CGSize.zero // 拖曳的偏移量
        
    
}
