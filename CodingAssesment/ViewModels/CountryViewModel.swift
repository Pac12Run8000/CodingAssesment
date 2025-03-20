import Foundation

class CountryViewModel {
    private let dataProvider: ProtocolDataProvider
    private(set) var countries: [CountryCellViewModel] = []

    var onDataUpdated: (() -> Void)?

    init(dataProvider: ProtocolDataProvider = CountryDataManager.shared) {
        self.dataProvider = dataProvider
    }

    func fetchCountries() {
        dataProvider.fetchCountries { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let countryModels):
                    self?.countries = countryModels.map { CountryCellViewModel(country: $0) }
                    self?.onDataUpdated?()
                case .failure(let error):
                    print("Error fetching countries: \(error.localizedDescription)")
                }
            }
        }
    }

    func numberOfRows() -> Int {
        return countries.count
    }

    func viewModelForCell(at index: Int) -> CountryCellViewModel {
        return countries[index]
    }
}
