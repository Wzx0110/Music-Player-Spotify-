//
//  AppState.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/25.
//

import SwiftUI
import AVFoundation

@Observable
class AppState : ObservableObject {
    var showAllView: Bool = true
    var showMusicView: Bool = false
    var showPodcastView: Bool = false
    
    var showHomePageView: Bool = true
    var showSearchView: Bool = false
    var showMusicLibraryView: Bool = false
    
    var showCreationView: Bool = false
    var showPersonalView: Bool = false
    
    var dragOffset = CGSize.zero // 拖曳的偏移量
    
    var showHomePageButton: Bool = true
    
    var showMusicPlayerView: Bool = false
    var showMusicBarView: Bool = false
    
    var currentSong: Song = MusicData.Artists[1].songs[0]
    var currentArtist: Artist = MusicData.Artists[1]
    
    var player: AVPlayer?
    var isPlaying = false
    var currentTime: Double = 0
    var totalTime: Double = 0
    var timer: Timer?
    var sliderValue: Double = 0
    var volume: Float = 0.5
    var lastVolume: Float = 0.5 // 保存最後的音量
    var isShuffle: Bool = false
    var isRepeating: Bool = false
    func setupPlayer() {
        print("currentSong: \(currentSong)")
        let url = Bundle.main.url(forResource: currentSong.name, withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem) // 將 AVPlayerItem 傳入 AVPlayer
        
        // 獲取總時長
        let duration = AVURLAsset(url: url).duration
        totalTime = CMTimeGetSeconds(duration)
        
        // 設置音量為上次的音量
        player?.volume = lastVolume
        
        // 初始化 slider 和播放監控
        sliderValue = 0
        startTimer()
    }
    
    func stopPlayer() {
        player?.pause() // 暫停播放
        timer?.invalidate() // 停止定時器
        isPlaying = false
    }
    
    func togglePlayPause() {
        guard let player = player else { return } // 確保播放器存在
        if isPlaying {
            print("pause")
            player.pause() // 如果正在播放，則暫停
        } else {
            print("play")
            player.play() // 如果暫停，則繼續播放
        }
        isPlaying.toggle() // 切換播放狀態
    }
    
    func seekToTime(_ time: Double) {
        let targetTime = CMTime(seconds: time, preferredTimescale: 600)
        player?.seek(to: targetTime) // 將播放器進度設置到目標時間
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            guard let player = self.player else { return }
            
            let currentTime = CMTimeGetSeconds(player.currentTime()) // 獲取當前播放時間
            self.currentTime = currentTime // 更新當前時間的屬性
            self.sliderValue = currentTime // 更新滑桿值
            
            if abs(currentTime - self.totalTime) < 0.1 { // 容錯處理
                self.stopPlayer()
                
                if self.isRepeating { // 如果處於重複播放模式
                    self.setupPlayer() // 重新設置播放器
                    self.player?.play() // 重新播放當前歌曲
                    self.isPlaying = true
                } else {
                    self.nextSong() // 播放下一首歌
                }
            }
        }
    }
    
    func previousSong() {
        guard let currentIndex = currentArtist.songs.firstIndex(of: currentSong) else { return }
        let previousIndex = (currentIndex - 1 + currentArtist.songs.count) % currentArtist.songs.count
        print(previousIndex)
        currentSong = currentArtist.songs[previousIndex]
        
        // 暫停當前player
        stopPlayer()
        
        // 設置player
        setupPlayer()
        player?.play()
        isPlaying = true
    }
    
    // 用來控制播放模式的切換
    func toggleShuffle() {
        isShuffle.toggle() // 切換隨機播放模式
    }
    
    // 更新 nextSong() 方法來處理隨機播放
    func nextSong() {
        if isShuffle {
            // 隨機選擇下一首歌
            guard let currentIndex = currentArtist.songs.firstIndex(of: currentSong) else { return }
            var nextIndex: Int
            repeat {
                nextIndex = Int.random(in: 0..<currentArtist.songs.count)
            } while nextIndex == currentIndex  // 確保不會重複播放當前歌曲
            currentSong = currentArtist.songs[nextIndex]
        } else {
            // 順序播放
            guard let currentIndex = currentArtist.songs.firstIndex(of: currentSong) else { return }
            let nextIndex = (currentIndex + 1) % currentArtist.songs.count
            currentSong = currentArtist.songs[nextIndex]
        }
        
        // 暫停當前player
        stopPlayer()
        
        // 設置player
        setupPlayer()
        player?.play()
        isPlaying = true
    }
    
    
    func changeSong() {
        stopPlayer()
        setupPlayer()
        player?.play()
        isPlaying = true
    }
    
    func repeatSong() {
        // 切換重複播放模式
        isRepeating.toggle()
        print("Repeat Mode: \(isRepeating ? "Enabled" : "Disabled")")
    }
    
    func formatTime(_ time: Double) -> String {
        let absTime = abs(time) // 獲取絕對值
        let minutes = Int(absTime) / 60 // 分鐘
        let seconds = Int(absTime) % 60 // 秒數
        let sign = time < 0 ? "-" : "" // 處理負時間情況
        return String(format: "%@%02d:%02d", sign, minutes, seconds)
    }
    
    // 更新音量並保存
    func setVolume(_ volume: Float) {
        player?.volume = volume
        lastVolume = volume // 保存當前音量
    }
}
