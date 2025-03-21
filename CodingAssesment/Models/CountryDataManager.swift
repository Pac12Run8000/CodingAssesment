import Foundation

class CountryDataManager: ProtocolDataProvider {
    static let shared = CountryDataManager() // Singleton instance

    private var apiURL: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "gist.githubusercontent.com"
        components.path = "/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
        
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
