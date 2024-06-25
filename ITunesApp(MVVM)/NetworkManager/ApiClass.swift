import Foundation

//MARK: Main API class
class ApiClass {
    static let shared = ApiClass()

    // MARK: Fetch Data function with Generic Type for JSON Decoder
    func fetchData<T : Codable>(url: String, completion: @escaping (T?) -> ()) {
        guard let serverURL = URL(string: url) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) { data, response, error in
            if let error = error {
                print("\(ErrorMessages.errorFetchMessage.rawValue): \(error)")
                completion(nil)
                return
            }
            guard let data = data else {
                print(ErrorMessages.noDataMessage.rawValue)
                completion(nil)
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            } catch {
                print("\(ErrorMessages.errorInSerializing.rawValue): \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    // MARK: Fetch Image function with generic Data? Type for converting the data to UIImage
    func fetchImage(from url: String, completion: @escaping (Data?) -> Void) {
        guard let imageURL = URL(string: url) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            if let error = error {
                print("\(ErrorMessages.errorFetchMessage.rawValue): \(error)")
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
}
