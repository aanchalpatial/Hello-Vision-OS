//
//  CarView.swift
//  Hello Vision OS
//
//  Created by Aanchal Patial on 02/07/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CarView: View {
    @State var enlarge = false

    var body: some View {
        VStack() {
            RealityView { content in
                if let carScene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(carScene)
                }
            } update: { content in
                if let scene = content.entities.first {
                    let factor: Float = enlarge ? 1.5 : 1
                    scene.transform.scale = [factor, factor, factor]
                }
            }
            .onTapGesture {
                enlarge.toggle()
            }
            Toggle("Click me or the model to enlarge", isOn: $enlarge)
                .toggleStyle(.button)
                .padding()
                .glassBackgroundEffect()
        }
    }
}

#Preview {
    CarView()
}
