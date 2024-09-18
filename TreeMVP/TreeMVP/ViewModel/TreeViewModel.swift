//
//  TreePresenter.swift
//  TreeMVP
//
//  Created by Yonael Tordjman on 18/09/2024.
//

import Foundation
import TreeServices

class TreeViewModel: ObservableObject {
    @Published var uiState: TreeState = .loading
    
    let repository: any TreeRepositoryProtocol
    
    init(repository: any TreeRepositoryProtocol) {
        self.repository = repository
    }
    
    @MainActor
    func fetch() async {
        let result = await repository.fetch()
        
        guard let _result = result else {
            uiState = .error(message: "An error occured")
            return
        }
                
        let trees = _result.results.map {
            Tree(from: $0)
        }
        
        uiState = .loaded(trees: trees)
    }
}
