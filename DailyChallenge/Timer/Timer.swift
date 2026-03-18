//
//  Timer.swift
//  DailyChallenge
//
//  Created by Luis Filipe Pedroso on 16/03/26.
//

import SwiftUI

struct Timer: View {
    
    @State private var selectedDuration: Int = 15
    
    var body: some View {
        ZStack {
            radialBackground
            
            VStack {
                timerRing
                
                HStack(spacing: 16) {
                    chipButton(duration: 5)
                    chipButton(duration: 15)
                    chipButton(duration: 30)
                }
                .padding(.top, 32)
                
                startButton
            }
        }
        .ignoresSafeArea()
    }
    
    private var radialBackground: some View {
        Group {
            Color(red: 0.047, green: 0.043, blue: 0.063)
            
            RadialGradient(
                stops: [
                    .init(color: Color.orange.opacity(0.04), location: 0.0),
                    .init(color: Color.orange.opacity(0.02), location: 0.35),
                    .init(color: .clear, location: 0.7)
                ],
                center: .center,
                startRadius: 0,
                endRadius: 600
            )
            
            Image("grain")
                .resizable(resizingMode: .tile)
                .opacity(0.35)
                .blendMode(.overlay)
        }
    }
    
    private var timerRing: some View {
        VStack {
            Text("sola")
                .textCase(.uppercase)
                .font(.subheadline)
                .fontWeight(.medium)
                .tracking(8)
                .foregroundStyle(.secondary.opacity(0.6))
            
            Spacer()
            
            Text("\(selectedDuration):00")
                .textCase(.uppercase)
                .font(.system(size: 72, weight: .light))
                .contentTransition(.numericText())
                .animation(.bouncy, value: selectedDuration)
            
            Spacer()
            
            Text("Swipe to Change")
                .textCase(.uppercase)
                .font(.caption)
                .fontWeight(.medium)
                .tracking(2)
                .foregroundStyle(.secondary.opacity(0.6))
            
        }
        .padding(.vertical, 56)
        .frame(width: 300, height: 300)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.orange.opacity(0.06), lineWidth: 8)
        )
    }
    
    private func chipButton(duration: Int) -> some View {
        Button {
            selectedDuration = duration
        } label: {
            Text("\(duration) min")
                .font(.headline)
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                .background(
                    Capsule(style: .continuous).stroke(selectedDuration == duration ? Color.orange.opacity(0.4) : Color.secondary.opacity(0.4), lineWidth: 1)
                )
        }
        .background(selectedDuration == duration ? Color.orange.opacity(0.12) : Color.clear, in: Capsule(style: .continuous))
        .foregroundStyle(selectedDuration == duration ? Color.orange : Color.secondary.opacity(0.6))
        .animation(.smooth, value: selectedDuration)
    }
    
    private var startButton: some View {
        Button {
            
        } label: {
            Image(systemName: "play.fill")
                .resizable()
                .frame(width: 16, height: 16)
                
        }
        .frame(width: 80, height: 80)
        .foregroundStyle(Color.black)
        .background(Color.orange, in: Circle())
        .overlay {
            Ellipse()
                .frame(width: 48, height: 1)
                .blur(radius: 3)
                .foregroundStyle(Color.orange)
                .padding(.top, 108)
        }
        .shadow(color: Color.orange.opacity(0.5), radius: 20, x: 0, y: 0)
        .padding(.top, 32)
    }
}

#Preview {
    Timer()
}
