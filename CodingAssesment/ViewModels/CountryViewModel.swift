import Foundation

class CountryViewModel {
    private let dataProvider: CountryDataProvider
    
    private var countries: [Country] = []
    
    init(dataProvider: CountryDataProvider) {
        self.dataProvider = dataProvider
        self.countries = dataProvider.fetchCountries()
    }
    
    func numberOfCountries() -> Int {
        return countries.count
    }
    
    func country(at index: Int) -> Country {
        return countries[index]
    }
}
