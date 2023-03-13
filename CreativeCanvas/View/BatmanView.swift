//
//  BatmanView.swift
//

import SwiftUI

struct BatShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0.99364*height))
        path.addCurve(to: CGPoint(x: 0.125*width, y: 0.42239*height), control1: CGPoint(x: 0.46051*width, y: 0.81976*height), control2: CGPoint(x: 0.33024*width, y: 0.46209*height))
        path.addCurve(to: CGPoint(x: 0.00196*width, y: 0.03053*height), control1: CGPoint(x: 0.14018*width, y: 0.2229*height), control2: CGPoint(x: 0.0493*width, y: 0.07803*height))
        path.addLine(to: CGPoint(x: 0.29123*width, y: 0.03053*height))
        path.addCurve(to: CGPoint(x: 0.41885*width, y: 0.26972*height), control1: CGPoint(x: 0.29804*width, y: 0.24326*height), control2: CGPoint(x: 0.37915*width, y: 0.27863*height))
        path.addLine(to: CGPoint(x: 0.41885*width, y: 0.03053*height))
        path.addLine(to: CGPoint(x: 0.46466*width, y: 0.1885*height))
        path.addLine(to: CGPoint(x: 0.53595*width, y: 0.1885*height))
        path.addLine(to: CGPoint(x: 0.58105*width, y: 0.03053*height))
        path.addLine(to: CGPoint(x: 0.58105*width, y: 0.27004*height))
        path.addCurve(to: CGPoint(x: 0.70849*width, y: 0.03053*height), control1: CGPoint(x: 0.6207*width, y: 0.27895*height), control2: CGPoint(x: 0.7017*width, y: 0.24354*height))
        path.addLine(to: CGPoint(x: 0.99738*width, y: 0.03053*height))
        path.addCurve(to: CGPoint(x: 0.87451*width, y: 0.42291*height), control1: CGPoint(x: 0.95011*width, y: 0.07809*height), control2: CGPoint(x: 0.85934*width, y: 0.22315*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.99491*height), control1: CGPoint(x: 0.66954*width, y: 0.46266*height), control2: CGPoint(x: 0.53943*width, y: 0.8208*height))
        return path
    }
}

struct BatmanView: View {
    @State private var isDrawOutlineActive = false
    @State private var isLightMoveActive: Bool = false
    let autoReverseShakeAnimation = Animation.linear(duration: 2).repeatForever(autoreverses: true).speed(1)

    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                // By Adam Borkowski
                Image("batmanBackground")
                    .resizable()

                ZStack(alignment: .top){
                    Triangle()
                        .foregroundColor(.white)
                        .frame(width: 230, height: 500)
                        .blendMode(.softLight)
                        .rotationEffect(Angle(degrees: 180))
                        .offset(x: 0, y: 50)

                    ZStack {
                        Ellipse()
                            .foregroundColor(.white)
                            .frame(width: 240, height: 120)
                            .blur(radius: 20)

                        Ellipse()
                            .foregroundColor(.white)
                            .frame(width: 240, height: 120)
                            .blendMode(.softLight)

                        BatShape()
                            .trim(from: 0, to: isDrawOutlineActive ? 1 : 0)
                            .stroke(.gray, lineWidth: 4)
                            .frame(width: 140, height: 70)
                            .offset(y: 10)
                            .blur(radius: 1)
                    }
                }
                .rotationEffect(Angle(degrees: isLightMoveActive ? 30 : 33))
                .offset(x: -60, y: 120)
                .onAppear {
                    withAnimation(autoReverseShakeAnimation) {
                        isLightMoveActive.toggle()
                    }
                }
            }
        }.ignoresSafeArea()
            .onAppear {
                withAnimation(.easeIn(duration: 6)) {
                    isDrawOutlineActive = true
                }
            }
    }
}

struct BatmanView_Previews: PreviewProvider {
    static var previews: some View {
        BatmanView()
    }
}


