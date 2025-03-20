import Foundation

protocol CountryDataProvider {
    static func fetchCountries() -> [Country]
}
