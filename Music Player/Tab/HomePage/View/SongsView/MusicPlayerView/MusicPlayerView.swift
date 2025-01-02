//
//  MusicPlayerView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/29.
//

import SwiftUI
import AVFoundation
import UIImageColors

struct MusicPlayerView: View {
    @EnvironmentObject var appState: AppState
    @State private var backgroundView: AnyView = AnyView(Color.black)
    
    var body: some View {
        ZStack {
            backgroundView.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 30) {
                    HStack(spacing: 60) { // 標頭
                        Button(action: {
                            appState.showMusicPlayerView = false
                        }) {
                            Image(systemName: "chevron.down")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width: 20)
                        }
                        
                        Text(appState.currentArtist.name)
                            .foregroundStyle(.white)
                            .frame(width: 200)
                            .bold()
                        
                        Button(action: {}) { // 未完成
                            Image(systemName: "ellipsis")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width: 20)
                        }
                    }
                    
                    // 歌曲封面
                    Image(appState.currentSong.name)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 360, height: 360)
                    
                    // 歌曲資訊
                    HStack(spacing: 80) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(appState.currentSong.name)
                                .foregroundStyle(.white)
                                .font(.title)
                                .bold()
                            Text(appState.currentArtist.name)
                                .foregroundStyle(.gray)
                                .font(.system(size: 18))
                                .bold()
                                .opacity(2)
                        }
                        .frame(width: 250, alignment: .leading)
                        
                        Button(action: {}) { // 未完成
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 30)
                        }
                    }
                    
                    // 播放進度條
                    VStack {
                        Slider(
                            value: Binding(
                                get: { appState.sliderValue },
                                set: { newValue in
                                    appState.sliderValue = newValue
                                    appState.seekToTime(newValue)
                                }
                            ),
                            in: 0...appState.totalTime
                        )
                        HStack {
                            Text(appState.formatTime(appState.currentTime))
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                            Spacer()
                            Text(appState.formatTime(appState.currentTime - appState.totalTime))
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                    }
                    .padding(.horizontal)
                    
                    // 播放控制
                    HStack(spacing: 40) {
                        ZStack {
                            Button(action: { // 隨機播放
                                appState.toggleShuffle()
                            }) {
                                Image(systemName: "shuffle")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(appState.isShuffle ? .green : .white)
                                    .frame(width: 30)
                            }
                            Text(".")
                                .foregroundStyle(.green)
                                .opacity(appState.isShuffle ? 1 : 0)
                                .offset(x: -1, y: 5)
                                .scaleEffect(2)
                        }
                        
                        Button(action: appState.previousSong) { // 上一首
                            Image(systemName: "backward.end.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 30)
                        }
                        
                        Button(action: appState.togglePlayPause) { // 播放暫停
                            Image(systemName: appState.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 70)
                        }
                        
                        Button(action: appState.nextSong) { // 下一首
                            Image(systemName: "forward.end.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 30)
                        }
                        
                        ZStack {
                            Button(action: appState.repeatSong) { // 循環播放
                                Image(systemName: "arrow.rectanglepath")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(appState.isRepeating ? .green : .white)
                                    .frame(width: 30)
                                    .scaleEffect(x: -1, y: -1)
                            }
                            Text(".")
                                .foregroundStyle(.green)
                                .opacity(appState.isRepeating ? 1 : 0)
                                .offset(x: -1, y: 5)
                                .scaleEffect(2)
                        }
                    }
                    
                    // 音量控制
                    HStack {
                        Image(systemName: "speaker.fill")
                            .foregroundStyle(.white)
                        Slider(value: $appState.volume, in: 0...1.0, step: 0.01)
                            .onChange(of: appState.volume) { newVolume in
                                appState.setVolume(newVolume)
                            }
                            .frame(width: 300)
                        Image(systemName: "speaker.wave.3.fill")
                            .foregroundStyle(.white)
                    }
                }
            }
            .onAppear {
                if !appState.isPlaying {
                    appState.setupPlayer()
                }
                updateBackgroundColor(for: appState.currentSong)
            }
            .onChange(of: appState.currentSong) { newSong in
                updateBackgroundColor(for: newSong)
            }
        }
    }
    
    // 提取圖片顏色
    private func updateBackgroundColor(for song: Song) {
        if let image = UIImage(named: song.name) {
            image.getColors { colors in
                if let primaryColor = colors?.primary, let secondaryColor = colors?.background {
                    // 創建漸層背景
                    let gradient = LinearGradient(
                        gradient: Gradient(colors: [Color(primaryColor), Color(secondaryColor)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    self.backgroundView = AnyView(gradient)
                } else {
                    self.backgroundView = AnyView(Color.black)
                }
            }
        }
    }
}

#Preview {
    MusicPlayerView()
        .environment(AppState())
}
