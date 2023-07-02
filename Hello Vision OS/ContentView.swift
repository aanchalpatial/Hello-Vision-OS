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
    @State private var selectedItem: Item?


    var body: some View {
        @Bindable var viewModel = viewModel

        NavigationSplitView {
            List(selection: $selectedItem) {
                ForEach(viewModel.items) { item in
                    NavigationLink(value: item) {
                        Text(item.title)
                    }
                }
            }
            .navigationTitle("Fundamentals")
        } detail: {
            if let selectedItem = selectedItem {
                VStack {
                    Text(selectedItem.detail)
                        .navigationTitle("Definition")
                    if selectedItem.title == "Volume" {
                        Button("Open CarView") {
                            openWindow(id: "CarView")
                        }
                    } else if selectedItem.title == "Full spaces" {
                        Button("Open PlaneImmersiveView") {
                            Task {
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

//        VStack {
//            ForEach(viewModel.items) { item in
//                Button(item.title) {
//                    if item.title == "Volume" {
//                        openWindow(id: "CarView")
//                    } else if item.title == "Full spaces" {
//                        Task {
//                            let result = await openImmersiveSpace(id: "PlaneImmersiveView")
//                            if case .error = result {
//                                assertionFailure("Unable to open PlaneImmersiveView")
//                            }
//                        }
//                    }
//                }
//                .padding()
//                .glassBackgroundEffect()
//            }
//        }
    }
}

#Preview {
    ContentView()
        .environment(ContentViewModel())
}
