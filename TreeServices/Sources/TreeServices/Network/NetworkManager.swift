import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponseServer
}

public protocol NetworkManagerProtocol<T> {
    associatedtype T: Codable
    func fetch() async throws -> T?
}

public final class NetworkManager<T: Codable>: NetworkManagerProtocol {
    
    public init() { }
    
    public func fetch() async throws -> T? {
        guard let url = URL(string: Constants.schemeURL + Constants.allTreesURL) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            print("Throw an error here")
            throw NetworkError.invalidResponseServer
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
