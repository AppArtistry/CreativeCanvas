//
//  HalfCapsuleShape.swift
//

import SwiftUI

struct HalfCapsuleShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path {
            $0.move(to: CGPoint.zero)
            $0.addLine(to: CGPoint(x: rect.maxX, y: 0))
            $0.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            $0.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midY, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            $0.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midY, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
            $0.addLine(to: CGPoint.zero)
        }
    }
}
