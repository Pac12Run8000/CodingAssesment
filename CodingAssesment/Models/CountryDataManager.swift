import Foundation

class CountryDataManager: ProtocolDataProvider {
    static let shared = CountryDataManager() // Singleton instance

    private let apiURL = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"

    func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        NetworkService.shared.fetchData(from: apiURL, completion: completion)
    }
}
