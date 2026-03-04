//
//  MusicPlayer.swift
//  DailyChallenge
//
//  Created by Luis Filipe Pedroso on 04/03/26.
//

import SwiftUI

extension Color {
    static let musicPlayerTheme = MusicPlayerTheme()
}

struct MusicPlayerTheme {
    let accent = Color("Accent")
    let background = Color("Background")
    let offwhite = Color("OffWhite")
    let darkGray = Color("DarkGray")
    let coral = Color("Coral")
    let gradientColorOne = Color("GradientColor1")
    let gradientColorTwo = Color("GradientColor2")
    let gradientColorThree = Color("GradientColor3")
}

struct MusicPlayer: View {
    
    @State private var isPlaying: Bool = true
    @State private var progress: Double = 0.5
    @State private var volume: Double = 0.2

    var body: some View {
        NavigationStack {
            VStack(spacing: 48) {
                albumArtWork
                
                VStack(alignment: .leading, spacing: 16) {
                    musicDetails
                    player
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    toolbarButton
                }
            }
        }
    }
    
    private var toolbarButton: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .font(Font.system(size: 14, weight: .semibold))

                Text("Now Playing")
                    .font(.headline)
                    .fontWeight(.medium)
            }
            .foregroundStyle(Color.musicPlayerTheme.accent)
        }
    }
    
    private var albumArtWork: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.musicPlayerTheme.gradientColorOne,
                    Color.musicPlayerTheme.gradientColorTwo,
                    Color.musicPlayerTheme.gradientColorThree,
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            Circle()
                .fill(
                    RadialGradient(
                        colors: [.white.opacity(0.8), Color.musicPlayerTheme.accent.opacity(0.2), .clear],
                        center: .center,
                        startRadius: 5,
                        endRadius: 60
                    )
                )
                .frame(width: 100, height: 100)

        }
        .frame(width: 280, height: 280)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.musicPlayerTheme.accent.opacity(0.8), radius: 8)
    }
    
    private var musicDetails: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Midnight Waves")
                .font(.title2)
            Text("Luna Synthesia")
                .font(.title3)
                .foregroundStyle(Color.musicPlayerTheme.offwhite)
        }
    }
    
    private var player: some View {
        VStack(spacing: 12) {
            Slider(value: $progress)
                .sliderThumbVisibility(.hidden)
                .padding(4)
                .tint(.accent)
                .cornerRadius(4)
            
            HStack {
                Text("2:18")
                    .foregroundStyle(Color.musicPlayerTheme.offwhite)
                Spacer()
                Text("-1:50")
                    .foregroundStyle(Color.musicPlayerTheme.offwhite)
            }
            
            HStack {
                Image(systemName: "backward.fill")
                    
                Button {
                    withAnimation(.smooth) {
                            isPlaying.toggle()
                    }
                } label: {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .symbolEffect(.bounce, value: isPlaying)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 48)
                }
                
                Image(systemName: "forward.fill")
            }
            .font(.title)
            .padding(.top, 40)
            
            HStack {
                Image(systemName: "speaker.fill")
                    .font(.headline)
                    .foregroundStyle(Color.musicPlayerTheme.offwhite)

                Slider(value: $volume)
                    .sliderThumbVisibility(.hidden)
                    .padding(2)
                    .tint(.accent)
                    .cornerRadius(4)
                
                Image(systemName: "speaker.wave.3.fill")
                    .font(.headline)
                    .foregroundStyle(Color.musicPlayerTheme.offwhite)
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    NavigationStack {
        MusicPlayer()
    }
}
