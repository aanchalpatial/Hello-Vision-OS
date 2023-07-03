//
//  ContentViewModel.swift
//  Hello Vision OS
//
//  Created by Aanchal Patial on 29/06/23.
//

import Foundation
import Observation

enum Topic: CaseIterable, Identifiable {
    case window, volume, fullSpaces

    var title: String {
        switch self {
        case .window:
            "Window"
        case .volume:
            "Volume"
        case .fullSpaces:
            "Full spaces"
        }
    }

    var details: String {
        switch self {
        case .window:
            "SwiftUI scenes that can be resized and reflowed"
        case .volume:
            "SwiftUI scenes, they use RealityKit to display 3D content"
        case .fullSpaces:
            "Dedicated space where only your app elements(window, volume, etc) appears."
        }
    }

    var id: String? {
        switch self {
        case .window:
            nil
        case .volume:
            "CarView"
        case .fullSpaces:
            "PlaneImmersiveView"
        }
    }

    var scene: String? {
        switch self {
        case .window:
            nil
        case .volume:
            "Scene"
        case .fullSpaces:
            "PlaneImmersiveView"
        }
    }
}

@Observable
class ContentViewModel {
    let topics = Topic.allCases
}
