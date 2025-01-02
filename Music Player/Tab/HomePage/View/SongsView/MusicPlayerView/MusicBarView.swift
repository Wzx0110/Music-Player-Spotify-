//
//  MusicBarView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/12/4.
//

import SwiftUI
import UIImageColors

struct MusicBarView: View {
    @EnvironmentObject var appState: AppState
    @State private var primaryColor: Color = .gray
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 400, height: 70)
                    .foregroundStyle(primaryColor)
                
                HStack {
                    Image(appState.currentSong.name)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(appState.currentSong.name)
                            .foregroundStyle(.white)
                            .font(.system(size: 16))
                        Text(appState.currentArtist.name)
                            .foregroundStyle(.gray)
                            .font(.system(size: 16))
                    }
                    Spacer()
                    Button(action: appState.togglePlayPause) { // 播放暫停
                        Image(systemName: appState.isPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .frame(width: 20)
                    }
                    .padding(10)
                }
                .padding(10)
                
                // 進度條
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(height: 3)
                        .foregroundColor(Color.gray.opacity(0.3))
                    
                    Capsule()
                        .frame(width: 400 * progress, height: 3)
                        .foregroundColor(.white)
                }
                .frame(width: 390)
                .offset(y: 35)
            }
            .offset(y: 285)
            .onTapGesture { appState.showMusicPlayerView = true }
            .fullScreenCover(isPresented: $appState.showMusicPlayerView) {
                MusicPlayerView()
            }
            .onAppear {
                updatePrimaryColor(for: appState.currentSong)
                startProgressUpdate()
            }
            .onChange(of: appState.currentSong) { _ in
                updatePrimaryColor(for: appState.currentSong)
            }
        }
    }
    
    // 更新進度
    private func startProgressUpdate() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            progress = CGFloat(appState.currentTime / appState.totalTime)
        }
    }
    
    // 提取圖片顏色
    private func updatePrimaryColor(for song: Song) {
        if let image = UIImage(named: song.name) {
            image.getColors { colors in
                if let primary = colors?.primary {
                    self.primaryColor = Color(primary)
                }
            }
        }
    }
}

#Preview {
    MusicBarView()
        .environmentObject(AppState())
}
