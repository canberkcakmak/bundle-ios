//
//  CustomDecoder.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 13.03.2024.
//

import Foundation

class CustomDecoder: JSONDecoder {
    override func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
        if let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            if let bundleStatusCode = dict["bundleStatusCode"] as? Int, bundleStatusCode == 0 {
                if let jsonData = try? JSONSerialization.data(withJSONObject: dict["data"] ?? [], options: []) {
                    return try super.decode(type, from: jsonData)
                }
            }
        }
        return try super.decode(type, from: data)
    }
}
