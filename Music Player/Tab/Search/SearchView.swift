//
//  SearchView.swift
//  Music Player
//
//  Created by 翁子翔 on 2024/11/25.
//

import SwiftUI

struct SearchView: View {
    let styles: [Style] = MusicStyle.Styles
    @Environment(AppState.self) private var appState
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            PersonalButton()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ZStack { // 搜尋(未完成)
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .frame(width: 390, height: 50)
                            .padding(.horizontal, 5)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("想聽什麼？")
                        }
                        .offset(x: -110)
                    }
                    Text("探索曲風")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding(.horizontal, 5)
                    HStack {
                        ForEach(1...3, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(width: 120, height: 200)
                                .padding(.horizontal, 5)
                        }
                    }
                    Text("瀏覽全部")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding(.horizontal, 5)
                    let columns = Array(repeating: GridItem(.flexible()), count: 2)
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(styles) { style in
                            Button(action: {
                                
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundStyle(style.background)
                                        .frame(width: 190, height: 120)
                                    HStack {
                                        Text(style.name)
                                            .font(.system(size: 18))
                                            .foregroundColor(.white)
                                            .bold()
                                            .frame(width: 120, alignment: .leading)
                                            .offset(x: 20, y: -40)
                                        Image(style.name)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                    }
                                    .offset(x: -5)
                                }
                            }
                        }
                    }
                }
            }
            .offset(y: 100)
            Text("搜尋")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .offset(x: -110, y: -330)
            Button(action: { // 按鈕（拍照）(未完成)
                
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 25, height: 25)
            }
            .offset(x: 170, y: -330)
        }
    }
}

#Preview {
    SearchView()
        .environment(AppState())
}
