//
//  APIService.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 12.03.2024.
//

import Alamofire
import Foundation

class APIService {
    func fetchData<T: Decodable>(url: String, completion: @escaping (Result<T, AFError>) -> Void) {

        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "language": Constants.deviceLanguage,
            "country": Constants.deviceCountry,
            "DeviceToken": Constants.deviceToken,
            "Platform": "IOS"
        ]

        AF.request(url, headers: headers)
            .validate()
            .responseDecodable(of: APIResponse<T>.self, decoder: JSONDecoder()) { response in
                switch response.result {
                case .success(let apiResponse):
                    if apiResponse.bundleStatusCode == 0 {
                        completion(.success(apiResponse.data))
                    } else {
                        let error = AFError.explicitlyCancelled
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

struct APIResponse<T: Decodable>: Decodable {
    let bundleStatusCode: Int
    let errorMessage: String?
    let data: T
}
