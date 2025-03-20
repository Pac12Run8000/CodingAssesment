import UIKit

class CountryCellViewModel {
    let countryName: String
    let region: String
    let capital: String
    let code: String

    init(country: Country) {
        self.countryName = country.name
        self.region = country.region
        self.capital = country.capital
        self.code = country.code
    }
}
