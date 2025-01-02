//
//  AllView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/25.
//

import SwiftUI

struct AllView: View {
    let artists: [Artist] = MusicData.Artists
    @Environment(AppState.self) private var appState
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        let columns = Array(repeating: GridItem(.flexible()), count: 2)
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(artists) { artist in
                                NavigationLink(destination: SongsView(artist: artist)) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundStyle(Color(red: 0.122, green: 0.122, blue: 0.122))
                                            .frame(width: 200, height: 60)
                                        HStack {
                                            Image(artist.name)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 60, height: 60)
                                                .clipShape(Circle())
                                            Text(artist.name)
                                                .font(.system(size: 14))
                                                .foregroundColor(.white)
                                                .bold()
                                                .frame(width: 120, alignment: .leading)
                                        }
                                        .offset(x: -5)
                                    }
                                }
                                .navigationTitle("")
                            }
                            
                        }
                        /*
                        Text("你的熱門合輯")
                            .foregroundStyle(Color.white)
                            .font(.title)
                            .bold()
                         */
                        Image(.simple)
                            .resizable()
                            .scaledToFit()
                            .offset(x: -10)
                    }
                    .offset(y: 100)
                }
                if appState.showHomePageButton {
                    HomePageButton()
                }
            }
            
        }
    }
}
#Preview {
    AllView()
        .environment(AppState())
}
