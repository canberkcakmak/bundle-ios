//
//  PackageSourceCellView.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 13.03.2024.
//

import SwiftUI
import Combine

class ObservablePackageSource: ObservableObject {
    @Published var packageSource: PackageSource

    init(packageSource: PackageSource) {
        self.packageSource = packageSource
    }
}

struct PackageSourceCellView: View {
    @ObservedObject var observablePackageSource: ObservablePackageSource

    init(packageSource: PackageSource) {
        self.observablePackageSource = ObservablePackageSource(packageSource: packageSource)
    }

    var body: some View {
        HStack {
            Text(observablePackageSource.packageSource.name)
                .font(.subheadline)
                .opacity(0.8)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: observablePackageSource.packageSource.isAdded ? "checkmark.square.fill" : "square")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 20, height: 20)
                .padding(10)
        }
        .contentShape(Rectangle())
    }
}
