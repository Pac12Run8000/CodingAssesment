import Foundation

class NetworkService {
    static let shared = NetworkService() // Singleton

    private init() {} // Prevent direct instantiation

    func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // Ensures correct decoding
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(NetworkError.decodingFailed(error)))
            }
        }
        task.resume()
    }
}

// MARK: - Network Errors
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingFailed(Error)
}
