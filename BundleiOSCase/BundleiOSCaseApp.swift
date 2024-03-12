//
//  BundleiOSCaseApp.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 10.03.2024.
//

import SwiftUI

@main
struct BundleiOSCaseApp: App {
    var body: some Scene {
        WindowGroup {
            PackageListView(viewModel: PackageViewModel())
        }
    }
}
