//
//  SongsView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/30.
//

import SwiftUI

struct SongsView: View {
    @EnvironmentObject var appState: AppState
    //@Environment(AppState.self) private var appState
    let artist: Artist
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(artist.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                            .padding(.horizontal)
                        
                        ForEach(Array(artist.songs.enumerated()), id: \.element.id) { index, song in
                            HStack(spacing: 10) {
                                Text("\(index + 1)")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .frame(width: 20)
                                
                                Button(action: {
                                    appState.currentArtist = artist
                                    appState.currentSong = song
                                    appState.showMusicBarView = true
                                    appState.showMusicPlayerView = appState.isPlaying ? false : true
                                    if appState.isPlaying {
                                        appState.changeSong()
                                    }
                                    
                                }) {
                                    HStack {
                                        Image(song.name)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                        Text(song.name)
                                            .font(.system(size: 16))
                                            .foregroundColor(.white)
                                            .font(.headline)
                                            .frame(width: 260, alignment: .leading)
                                    }
                                }
                                
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 20)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $appState.showMusicPlayerView) {
                MusicPlayerView()
                
            }
        }
        .navigationTitle(artist.name)
        .toolbarBackground(artist.background, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    SongsView(artist: MusicData.Artists[1])
        .environmentObject(AppState())
}
