import Foundation

protocol CountryDataProvider {
    func fetchCountries() -> [Country]
}
