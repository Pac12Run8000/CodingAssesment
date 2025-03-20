import Foundation

class CountryViewModel {
    private let countryProvider: CountryDataProvider
    private(set) var countries: [CountryCellViewModel] = []

    var onDataUpdated: (() -> Void)?

    init(countryProvider: CountryDataProvider = CountryDataManager.shared) { // Default to singleton
        self.countryProvider = countryProvider
    }

    func fetchCountries() {
        let countryModels = countryProvider.fetchCountries()
        self.countries = countryModels.map { CountryCellViewModel(country: $0) }
        onDataUpdated?()
    }

    func numberOfRows() -> Int {
        return countries.count
    }

    func viewModelForCell(at index: Int) -> CountryCellViewModel {
        return countries[index]
    }
}

