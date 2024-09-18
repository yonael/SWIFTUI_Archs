import Foundation
import TreeServices

protocol ListInteractorProtocol {
    func fetch() async
}

final class ListInteractor: ListInteractorProtocol {
    
    let repository: any TreeRepositoryProtocol
    let viewModel: ContentViewModel
    let presenter: any ListPresenterProtocol
    
    init(
        repository: any TreeRepositoryProtocol,
        viewModel: ContentViewModel,
        presenter: any ListPresenterProtocol
    ) {
        self.repository = repository
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    @MainActor
    func fetch() async {
        let trees = await fetchFrom()
        presenter.present(trees: trees)
    }
    
    private func fetchFrom() async -> [TreeResponse] {
        let response = await repository.fetch()
        if let response {
            return response.results
        } else {
            return []
        }
    }
    
}
