//
//  PackageListViewModel.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 12.03.2024.
//

import SwiftUI
import Alamofire
import Combine

class PackageViewModel: ObservableObject {
    @Published var packages: [Package] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private let packageService = APIService()

    func fetchPackages() {
        isLoading = true

        packageService.fetchData(url: "\(Constants.apiURL)\(APIServices.packagesList)") { [weak self] (result: Result<[Package], AFError>) in
            guard let self = self else { return }

            switch result {
            case .success(let packages):
                self.packages = packages.sorted { $0.index < $1.index }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print(error)
            }
            self.isLoading = false
        }
    }
}
