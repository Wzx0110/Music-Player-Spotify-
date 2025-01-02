//
//  SongData.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/30.
//

import SwiftUI

struct Artist: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let background: Color
    let songs : [Song]
}

struct Song: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct Style: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let background: Color
}

struct MusicStyle {
    static let Styles = [
        Style(name: "韓國流行樂", background: Color(red: 0.827, green: 0.220, blue: 0.231)),
        Style(name: "流行樂", background: Color(red: 0.329, green: 0.486, blue: 0.576))]
    
}

struct MusicData {
    static let Artists = [
        /*
         Artist(name: "已按讚的歌曲", background: Color(red: 0.212, green: 0.286, blue: 0.690), songs : [Song(name: "Supernova",
         background: Color(red: 0.416, green: 0.086, blue: 0.102))]),
         */
        Artist(name: "NewJeans",
               background: Color(red: 0.416, green: 0.086, blue: 0.102),
               songs :[Song(name: "Ditto"),
                       Song(name: "Hype Boy"),
                       Song(name: "OMG"),
                       Song(name: "How Sweet"),
                       Song(name: "Supernatural"),
                       Song(name: "ETA")]),
        Artist(name: "aespa",
               background: Color(red: 0.416, green: 0.086, blue: 0.102),
               songs :[Song(name: "Whiplash"),
                       Song(name: "Drama"),
                       Song(name: "Supernova"),
                       Song(name: "UP(KARINA Solo)"),
                       Song(name: "Live My Life")]),
        Artist(name: "BABYMONSTER",
               background: Color(red: 0.416, green: 0.086, blue: 0.102),
               songs :[Song(name: "DRIP"),
                       Song(name: "SHEESH"),
                       Song(name: "FOREVER")]),
        Artist(name: "KISS OF LIFE",
               background: Color(red: 0.416, green: 0.086, blue: 0.102),
               songs :[Song(name: "Sticky"),
                       Song(name: "Igloo"),
                       Song(name: "Midas Touch"),
                       Song(name: "Sugarcoat"),
                       Song(name: "Nobody Knows"),
                       Song(name: "Shhh")]),
    ]
}
