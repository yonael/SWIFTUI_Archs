//
//  TreeMVPApp.swift
//  TreeMVP
//
//  Created by Yonael Tordjman on 16/09/2024.
//

import SwiftUI
import TreeServices

@main
struct TreeMVPApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: TreeViewModel(repository: TreeRepository(manager: NetworkManager<ResultResponse>())))
        }
    }
}
