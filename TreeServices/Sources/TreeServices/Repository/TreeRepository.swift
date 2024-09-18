import Foundation

public protocol TreeRepositoryProtocol {
    func fetch() async -> ResultResponse?
}

public final class TreeRepository: TreeRepositoryProtocol {
    
    let manager: any NetworkManagerProtocol<ResultResponse>
    
    public init(manager: any NetworkManagerProtocol<ResultResponse>) {
        self.manager = manager
    }
    
    public func fetch() async -> ResultResponse? {
        do {
            let response = try await manager.fetch()
            return response
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
