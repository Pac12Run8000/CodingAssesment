import Foundation

class CountryDataManager: CountryDataProvider {
    static let shared = CountryDataManager() // Singleton
    private init() {}
    
    func fetchCountries() -> [Country] {
        return [
            Country(name: "Canada", region: "North America", capital: "Ottawa", code: "CAN"),
            Country(name: "Germany", region: "Europe", capital: "Berlin", code: "DEU"),
            Country(name: "Japan", region: "Asia", capital: "Tokyo", code: "JPN"),
            Country(name: "Brazil", region: "South America", capital: "Brasília", code: "BRA")
        ]
    }
}
