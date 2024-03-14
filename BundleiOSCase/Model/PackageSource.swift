//
//  PackageDetail.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 13.03.2024.
//

import Foundation

struct PackageSource: Identifiable, Decodable {
    let id: Int
    var isAdded: Bool
    let name: String
    let index: Int
    let channelCategoryId: Int
    let categoryLocalizationKey: String
    let countryId: Int
    let isVideoChannel: Bool
}
