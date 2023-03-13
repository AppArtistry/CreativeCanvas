//
//  RainbowLoadingView.swift
//

import SwiftUI

struct RainbowLoadingView: View {
    @State private var startAnimation = false
    private let anchor = UnitPoint(x: 0.75, y: 0.07)
    private let initialDegree = 60.0
    private let animation = Animation.linear(duration: 2).repeatForever(autoreverses: false)

    var body: some View {
        ZStack {
            HalfCircle(fillColor: .green)
            HalfCircle(fillColor: .blue)
                .rotationEffect(.degrees(initialDegree), anchor: anchor)
            HalfCircle(fillColor: .purple)
                .rotationEffect(.degrees(initialDegree * 2), anchor: anchor)
            HalfCircle(fillColor: .red)
                .rotationEffect(.degrees(initialDegree * 3), anchor: anchor)
            HalfCircle(fillColor: .orange)
                .rotationEffect(.degrees(initialDegree * 4), anchor: anchor)
            HalfCircle(fillColor: .yellow)
                .rotationEffect(.degrees(initialDegree * 5), anchor: anchor)
        }
        .frame(width: 100, height: 100)
        .offset(x: -25, y: 45)
        .background(.white)
        .clipShape(Circle())
        .shadow(color: .gray, radius: 1)
        .rotationEffect(.degrees(startAnimation ? 0 : -360))
        .animation(animation, value: startAnimation)
        .onAppear {
            startAnimation.toggle()
        }
    }
}

struct CircleMask: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        path.addPath(
            Circle()
                .path(in: rect.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
                    .offsetBy(dx: 50, dy: 0)))
        return path
    }
}

struct HalfCircle: View {
    let fillColor: Color
    var body: some View {
        Circle()
            .fill(fillColor)
            .mask(CircleMask()
                .fill(style: FillStyle(eoFill: true))
            )
    }
}

struct RainbowLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        RainbowLoadingView()
            .preferredColorScheme(.dark)
    }
}
