import Foundation

class CountryViewModel {
    var countries: [Country] = [
        Country(name: "Canada", region: "North America", capital: "Ottawa", code: "CAN"),
        Country(name: "Germany", region: "Europe", capital: "Berlin", code: "DEU"),
        Country(name: "Japan", region: "Asia", capital: "Tokyo", code: "JPN"),
        Country(name: "Brazil", region: "South America", capital: "Brasília", code: "BRA")
    ]
    
    func numberOfCountries() -> Int {
        return countries.count
    }
    
    func country(at index: Int) -> Country {
        return countries[index]
    }
}
