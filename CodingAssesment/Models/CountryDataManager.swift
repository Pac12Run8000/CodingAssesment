import Foundation

class CountryDataManager: ProtocolDataProvider {
    static let shared = CountryDataManager() // Singleton instance

    private var apiURL: URL? {
        var components = URLComponents()
        components.scheme = Constants.Url.scheme
        components.host = Constants.Url.hostGist
        components.path = Constants.Url.pathGist
        return components.url
    }

    func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        guard let url = apiURL else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        NetworkService.shared.fetchData(from: url.absoluteString, completion: completion)
    }
}
