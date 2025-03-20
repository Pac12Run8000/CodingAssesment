import Foundation

protocol ProtocolDataProvider {
    func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void)
}
