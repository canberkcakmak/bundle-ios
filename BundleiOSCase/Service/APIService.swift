//
//  APIService.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 12.03.2024.
//

import Alamofire
import Foundation

import Alamofire
import Foundation

class APIService {
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "language": Constants.deviceLanguage,
        "country": Constants.deviceCountry,
        "DeviceToken": Constants.deviceToken,
        "Platform": "IOS"
    ]
    
    func fetchData<T: Decodable>(url: String, decoder: JSONDecoder, completion: @escaping (Result<T, AFError>) -> Void) {
        AF.request("\(Constants.apiURL)\(url)", headers: headers)
            .validate()
            .responseDecodable(of: T.self, decoder: decoder) { response in
                switch response.result {
                case .success(let result):
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
