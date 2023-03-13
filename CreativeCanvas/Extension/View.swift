//
//  View.swift
//

import SwiftUI

extension View {
    func innerShadow<S: Shape>(using shape: S, angle: Angle = .degrees(0), color: Color = .black, width: CGFloat = 6, blur: CGFloat = 6) -> some View {
        return self
    }

    func multicolorGlow() -> some View {
        ZStack {
            ForEach(0..<3) { i in
                Rectangle()
                    .fill(AngularGradient(gradient: Gradient(colors: [.blue, .purple, .pink, .blue]), center: .center))
                    .frame(width: 150, height: 150)
                    .mask(self.blur(radius: 6))
                    .overlay(self.blur(radius: 5 - CGFloat(i * 5)))
            }
        }
    }

    func glow(color: Color = .white, radius: CGFloat = 10) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 4)
            .shadow(color: color, radius: radius / 5)
    }
}


