//
//  ContentViewModel.swift
//  Hello Vision OS
//
//  Created by Aanchal Patial on 29/06/23.
//

import Foundation
import Observation

struct Item: Identifiable, Hashable {
    var id = UUID()
    let title: String
    let detail: String
    let subItems: [Item]?
}

@Observable
class ContentViewModel {
    let items = [Item(title: "Window", detail: "SwiftUI scenes that can be resized and reflowed", subItems: nil),
                 Item(title: "Volume", detail: "SwiftUI scenes, they use RealityKit to display 3D content",  subItems: nil),
                 Item(title: "Full spaces", detail: "Dedicated space where only your app elements(window, volume, etc) appears.",  subItems: nil),]
}
