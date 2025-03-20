import Foundation

class MockDataProvider: ProtocolDataProvider {
    func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        let mockCountries: [Country] = [
            Country(
                capital: "Ottawa",
                code: "CAN",
                currency: Currency(code: "CAD", name: "Canadian Dollar", symbol: "$"),
                flag: "🇨🇦",
                language: Language(code: "en", name: "English", iso6392: "eng", nativeName: "English"),
                name: "Canada",
                region: .na,
                demonym: "Canadian"
            ),
            Country(
                capital: "Berlin",
                code: "DEU",
                currency: Currency(code: "EUR", name: "Euro", symbol: "€"),
                flag: "🇩🇪",
                language: Language(code: "de", name: "German", iso6392: "deu", nativeName: "Deutsch"),
                name: "Germany",
                region: .eu,
                demonym: "German"
            ),
            Country(
                capital: "Tokyo",
                code: "JPN",
                currency: Currency(code: "JPY", name: "Japanese Yen", symbol: "¥"),
                flag: "🇯🇵",
                language: Language(code: "ja", name: "Japanese", iso6392: "jpn", nativeName: "日本語"),
                name: "Japan",
                region: .ja,
                demonym: "Japanese"
            )
        ]

        // Simulate a network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            completion(.success(mockCountries))
        }
    }
}
