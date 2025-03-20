import Foundation

class CountryViewModel {
    private(set) var countries: [CountryCellViewModel] = []

    var onDataUpdated: (() -> Void)?

    func fetchCountries() {
        let countryModels = CountryDataManager.fetchCountries() // ✅ FIXED
        self.countries = countryModels.map { CountryCellViewModel(country: $0) }
        onDataUpdated?() // ✅ Notify ViewController to reload data
    }

    func numberOfRows() -> Int {
        return countries.count
    }

    func viewModelForCell(at index: Int) -> CountryCellViewModel {
        return countries[index]
    }
}

