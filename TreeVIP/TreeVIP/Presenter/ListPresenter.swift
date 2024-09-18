import Foundation
import TreeServices

protocol ListPresenterProtocol {
    func present(trees: [TreeResponse])
}

final class ListPresenter: ListPresenterProtocol {
    
    let viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    func present(trees: [TreeResponse]) {
        viewModel.trees = trees.map {
            Tree(from: $0)
        }
    }
        
}
