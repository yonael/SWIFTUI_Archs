//
//  ContentView.swift
//  TreeVIP
//
//  Created by Yonael Tordjman on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    let interactor: any ListInteractorProtocol
    
    init(viewModel: ContentViewModel, interactor: any ListInteractorProtocol) {
        self.viewModel = viewModel
        self.interactor = interactor
    }
    
    var body: some View {
        NavigationStack {
            List(viewModel.trees, id: \.self) { tree in                
                NavigationLink {
                    TreeDetail(tree: tree)
                } label: {
                    Text(tree.name ?? "No name")
                }
            }
            .navigationTitle("Trees Project")
        }
        .onAppear {
            Task {
                await interactor.fetch()
            }
        }
    }
}
