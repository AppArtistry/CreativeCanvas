//
//  FlipStepperView.swift
//

import SwiftUI

struct FlipSectionView: View {
    var number: Int
    var isTop: Bool
    var body: some View {
        let padding: Edge.Set = isTop ? .bottom : .top
        Text("\(number)")
            .font(.system(size: 50, weight: .black ,design: .monospaced))
            .foregroundColor(.black)
            .fixedSize()
            .padding(padding, -20)
            .frame(width: 50, height: 30, alignment: isTop ? .bottom : .top)
            .padding([(isTop ? .top : .bottom), .leading, .trailing] , 20)
            .background(.white)
            .clipped()
            .cornerRadius(10)
            .padding(padding, -10)
            .clipped()
            .overlay(
                HStack {
                    Circle()
                        .frame(width: 6)
                    Spacer()

                    Circle()
                        .frame(width: 6)
                }
                    .foregroundColor(.black)
                    .padding(.horizontal, 4)
                    .offset(y: isTop ? 14 : -14)
            )
    }
}

struct StepperButtonView: View {
    var isPlus: Bool
    var body: some View {
        ZStack {
            HalfCapsuleShape()
                .frame(width: 60, height: 60)
                .opacity(0.5)
                .shadow(color: .black, radius: 6)

            Circle()
                .frame(width: 40, height: 40)
                .shadow(color: .black, radius: 10)

            Image(systemName: isPlus ? "plus" : "minus")
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .heavy, design: .monospaced))

        }
        .rotationEffect(Angle(degrees: isPlus ? 0 : 180))
    }
}


struct FlipStepperView: View {
    @State private var initialNumber: Int = 0
    @State private var nextNumber: Int = 0
    @State private var isTopAnimationActive = false
    @State private var isBottomAnimationActive = false

    func flipNumber(isIncrement: Bool) {
        initialNumber = nextNumber
        isTopAnimationActive = false
        isBottomAnimationActive = false

        withAnimation(Animation.easeIn(duration: 0.3)) {
            if isIncrement {
                guard nextNumber < 99 else { return }
                nextNumber += 1
            } else {
                guard nextNumber > 0 else { return }
                nextNumber -= 1
            }
            isTopAnimationActive = true
        }
        withAnimation(Animation.easeOut(duration: 0.3).delay(0.3)) {
            isBottomAnimationActive = true
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            StepperButtonView(isPlus: true)
                .onTapGesture {
                    flipNumber(isIncrement: true)
                }

            VStack(spacing: 0) {
                ZStack {
                    FlipSectionView(number: nextNumber, isTop: true)
                    FlipSectionView(number: initialNumber, isTop: true)
                        .rotation3DEffect(
                            .init(degrees: isTopAnimationActive ? -90 : .zero),
                            axis: (1, 0, 0),
                            anchor: .bottom,
                            perspective: 0.5
                        )
                }
                Color.black
                    .frame(height: 2)
                ZStack {
                    FlipSectionView(number: initialNumber, isTop: false)
                    FlipSectionView(number: nextNumber, isTop: false)
                        .rotation3DEffect(
                            .init(degrees: isBottomAnimationActive ? .zero : 90),
                            axis: (1, 0, 0),
                            anchor: .top,
                            perspective: 0.5
                        )
                }
            }
            .fixedSize()
            .padding(.vertical)
            .shadow(color: .black, radius: 10)

            StepperButtonView(isPlus: false)
                .onTapGesture {
                    flipNumber(isIncrement: false)
                }
        }
        .padding(.horizontal, 12)
        .background(.white.opacity(0.2))
        .cornerRadius(20)
    }
}

struct FlipStepperView_Previews: PreviewProvider {
    static var previews: some View {
        FlipStepperView()
            .preferredColorScheme(.dark)
    }
}
