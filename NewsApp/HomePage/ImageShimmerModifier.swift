//
//  ImageShimmerView.swift
//  NewsApp
//
//  Created by Vivek on 21/09/26.
//

import SwiftUI

struct Shimmer: ViewModifier {

    let animation: Animation
    let gradient: Gradient
    let bandSize: CGFloat

    @State private var isInitialState = true

    init(
        animation: Animation = .linear(duration: 1.5)
            .repeatForever(autoreverses: false),
        gradient: Gradient = Gradient(colors: [
            .clear,
            .white.opacity(0.6),
            .clear
        ]),
        bandSize: CGFloat = 0.3
    ) {
        self.animation = animation
        self.gradient = gradient
        self.bandSize = bandSize
    }

    private var startPoint: UnitPoint {
        isInitialState
            ? UnitPoint(x: -bandSize, y: -bandSize)
            : UnitPoint(x: 1, y: 1)
    }

    private var endPoint: UnitPoint {
        isInitialState
            ? UnitPoint(x: 0, y: 0)
            : UnitPoint(x: 1 + bandSize, y: 1 + bandSize)
    }

    func body(content: Content) -> some View {
        content
            .overlay {
                LinearGradient(
                    gradient: gradient,
                    startPoint: startPoint,
                    endPoint: endPoint
                )
            }
            .mask(content)
            .animation(animation, value: isInitialState)
            .onAppear {
                DispatchQueue.main.async {
                    isInitialState = false
                }
            }
    }
}

extension View {
    func shimmer(
        animation: Animation = .linear(duration: 1.5)
            .repeatForever(autoreverses: false),
        gradient: Gradient = Gradient(colors: [
            .clear,
            .white.opacity(0.6),
            .clear
        ]),
        bandSize: CGFloat = 0.3
    ) -> some View {
        modifier(
            Shimmer(
                animation: animation,
                gradient: gradient,
                bandSize: bandSize
            )
        )
    }
}
