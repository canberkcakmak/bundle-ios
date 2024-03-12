//
//  Package.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 12.03.2024.
//

import Foundation

struct Package: Identifiable, Decodable {
    let id: Int
    let isAdded: Bool
    let name: String
    let description: String
    let index: Int
    let image: String
    let style: Style
    let sourceCount: Int
}

struct Style: Decodable {
    let fontColor: String
}
