//
//  TreeVIPApp.swift
//  TreeVIP
//
//  Created by Yonael Tordjman on 16/09/2024.
//

import SwiftUI

@main
struct TreeVIPApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = ContentViewModel()
            
            ContentView(
                viewModel: viewModel,
                interactor: InteractorInjection.listInjectionInteractor(viewModel: viewModel)
            )
        }
    }
}
