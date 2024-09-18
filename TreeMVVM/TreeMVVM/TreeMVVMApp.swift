//
//  TreeMVVMApp.swift
//  TreeMVVM
//
//  Created by Yonael Tordjman on 16/09/2024.
//

import SwiftUI
import TreeServices

@main
struct TreeMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(repository: TreeRepository(manager: NetworkManager<ResultResponse>())))
        }
    }
}
