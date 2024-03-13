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
    @Published var packageSources: [PackageSource] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var selectedPackageId: Int?
    @Published var isDetailPresented: Bool = false

    private let packageService = APIService()

    func navigateToDetail(id: Int){
        self.selectedPackageId = id
        self.isDetailPresented = true
    }
    
    func fetchPackages() {
        isLoading = true
        packageService.fetchData(url: "\(APIServices.packagesList)", decoder: CustomDecoder()) { [weak self] (result: Result<[Package], AFError>) in
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
    
    func fetchPackageSources(packageId: Int){
        isLoading = true
        packageService.fetchData(url: "\(APIServices.packagesDetail)\(packageId)", decoder: CustomDecoder()) { [weak self] (result: Result<[PackageSource], AFError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let sources):
                self.packageSources = sources.sorted { $0.index < $1.index }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print(error)
            }
            self.isLoading = false
        }
    }
}
