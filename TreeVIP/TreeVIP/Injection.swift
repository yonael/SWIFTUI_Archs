import Foundation
import TreeServices

enum InteractorInjection {
    static func listInjectionInteractor(viewModel: ContentViewModel) -> any ListInteractorProtocol {
        ListInteractor(
            repository: TreeRepository(manager: NetworkManager<ResultResponse>()),
            viewModel: viewModel,
            presenter: PresenterInjection.listInjectionPresenter(viewModel: viewModel)
        )
    }
}

enum PresenterInjection {
    static func listInjectionPresenter(viewModel: ContentViewModel) -> any ListPresenterProtocol {
        ListPresenter(viewModel: viewModel)
    }
}
