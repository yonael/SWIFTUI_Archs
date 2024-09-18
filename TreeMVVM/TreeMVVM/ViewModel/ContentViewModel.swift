//
//  ContentViewModel.swift
//  TreeMVVM
//
//  Created by Yonael Tordjman on 17/09/2024.
//

import Foundation
import TreeServices

final class ContentViewModel: ObservableObject {
    
    @Published var trees: [Tree] = []
    
    private let repository: TreeRepositoryProtocol
    
    init(repository: TreeRepositoryProtocol) {
        // IF THE REPOSITORY WASNT PART OF A PACKAGE, THEN IT SHOULD BE A PART OF MODEL
        self.repository = repository
    }
    
    @MainActor
    func fetch() async -> [Tree] {
        let result = await repository.fetch()
        
        guard let _result = result else { return [] }
                
        trees = _result.results.map {
            Tree(from: $0)
        }
        
        return trees
    }
    
}
