//
//  PackageDetailView.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 12.03.2024.
//

import SwiftUI

struct PackageDetailView: View {
    var package: Package

    var body: some View {
        VStack {
            Text(package.name)
                .font(.title)
            Text(package.description)
                .foregroundColor(.secondary)

        }
        .padding()
        .navigationTitle("Package Detail")
    }
}
