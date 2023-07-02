//
//  Hello_Vision_OSApp.swift
//  Hello Vision OS
//
//  Created by Aanchal Patial on 22/06/23.
//

import SwiftUI

@main
struct Hello_Vision_OSApp: App {
    @State private var viewModel = ContentViewModel()
    
    var body: some Scene {
        // The main window, entry point of the app
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }

        WindowGroup(id: "CarView") {
            CarView()
        }
        .windowStyle(.volumetric)

        ImmersiveSpace(id: "PlaneImmersiveView") {
            PlaneImmersiveView()
        }
    }
}
