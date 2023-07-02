//
//  PlaneImmersiveView.swift
//  Hello Vision OS
//
//  Created by Aanchal Patial on 02/07/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PlaneImmersiveView: View {
    var body: some View {
        RealityView { content in
            if let planeScene = try? await Entity(named: "PlaneImmersiveView", in: realityKitContentBundle) {
                content.add(planeScene)
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded({ value in
            var transform = value.entity.transform
            transform.translation = [0.1, 0, -0.1]
            value.entity.move(to: transform,
                              relativeTo: nil,
                              duration: 3,
                              timingFunction: .easeInOut)
        }))
    }
}

#Preview {
    PlaneImmersiveView()
}
