import Foundation
import Alamofire

class NetworkManager {
    // MARK: - Properties
    static var shared = NetworkManager()
    private var decoder = JSONDecoder()

    // MARK: - Init
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    // MARK: - Methods
    func sendRequest(url: String, paramet: Parameters?, completion: @escaping (Result<[Article], Error>) -> Void ) {
        guard let reachabilityManager = NetworkReachabilityManager(), reachabilityManager.isReachable else {
            completion(.failure(NetworkErrors.NoInterner))
            return
        }
        
        AF.request(
            url,
            method: .get,
            parameters: paramet
            
        ).validate().response { response in
            switch response.result {
            case .success(let data):
                do {
                    let result = try self.decoder.decode(SearchModel.self, from: data!)
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(NetworkErrors.DecodingFailed))
                }
            case .failure(_):
                completion(.failure(NetworkErrors.InvalidRequest))
            }
        }
    }
    
    func setParam(promt: String, sort: String) -> Parameters {
         let param: Parameters = [
            "apiKey" : "4ec7e121ad774facbbb3d884513b134a",
            "q" : promt,
            "language" : "ru",
            "sortBy" : sort
        ]
        
        return param
    }
}
