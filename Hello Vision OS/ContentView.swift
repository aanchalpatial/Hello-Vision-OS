//
//  ContentView.swift
//  Hello Vision OS
//
//  Created by Aanchal Patial on 22/06/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(ContentViewModel.self) private var viewModel
    @Environment(\.openWindow) private var openWindow
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State private var selectedTopic: Topic?


    var body: some View {
        @Bindable var viewModel = viewModel

        NavigationSplitView {
            List(selection: $selectedTopic) {
                ForEach(viewModel.topics) { topic in
                    NavigationLink(value: topic) {
                        Text(topic.title)
                    }
                }
            }
            .navigationTitle("Fundamentals")
        } detail: {
            if let selectedItem = selectedTopic {
                VStack(spacing: 32) {
                    Text(selectedItem.details)
                        .navigationTitle("Details")
                    switch selectedItem {
                    case .window:
                        Image(systemName: "macwindow")
                            .resizable()
                            .frame(width: 200, height: 150)
                            .aspectRatio(contentMode: .fit)
                    case .volume:
                        Model3D(named: "Scene", bundle: realityKitContentBundle)
                            .padding()
                        Button("Open CarView in a dedicated volume") {
                            Task {
                                await dismissImmersiveSpace()
                                openWindow(id: "CarView")
                            }
                        }
                    case .fullSpaces:
                        Button("Open PlaneImmersiveView") {
                            Task {
                                dismissWindow(id: "CarView")
                                let result = await openImmersiveSpace(id: "PlaneImmersiveView")
                                if case .error = result {
                                    assertionFailure("Unable to open PlaneImmersiveView")
                                }
                            }
                        }
                    }
                }
            } else {
                Text("Choose an item from the sidebar")
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ContentViewModel())
}
