//
//  ContentView.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 10.03.2024.
//

import SwiftUI

class PackageDetailData: ObservableObject {
    @Published var packageId: Int?
    @Published var allItemsAdded: Bool?
}

struct PackageListView: View {
    @ObservedObject var viewModel: PackageViewModel
    @StateObject var packageDetailData = PackageDetailData()
    @State private var isPackageDetailUpdated = false

    init(){
        self.viewModel = PackageViewModel()
    }

    var body: some View {
        NavigationView {
            VStack() {
                if viewModel.isLoading {
                    ProgressView("")
                        .progressViewStyle(CircularProgressViewStyle(tint: .red))
                        .scaleEffect(1.5)
                } else {
                    List {
                        ForEach(viewModel.packages.indices, id: \.self) { index in
                            PackageCellView(package: viewModel.packages[index])
                                .onTapGesture {
                                    viewModel.navigateToDetail(id: viewModel.packages[index].id)
                                    isPackageDetailUpdated = false
                                    packageDetailData.packageId = nil
                                    packageDetailData.allItemsAdded = nil
                            }
                        }
                    }
                    
                    .listStyle(.plain)
                    .navigationBarTitle("Bundle", displayMode: .large)
                    .sheet(isPresented: $viewModel.isDetailPresented) {
                        if let _id = viewModel.selectedPackageId{
                            PackageDetailView(packageId: _id, detailData: self.packageDetailData)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchPackages()
            }
            .onReceive(packageDetailData.$packageId.combineLatest(packageDetailData.$allItemsAdded)) { packageId, allItemsAdded in
                if let packageId = packageId, let allItemsAdded = allItemsAdded, !isPackageDetailUpdated {
                    print("Received packageId: \(packageId), allItemsAdded: \(allItemsAdded)")
                    viewModel.packageToggleChange(for: packageId, isAdded: allItemsAdded)
                    isPackageDetailUpdated = true
                }
            }
        }
    }
}


#Preview {
    PackageListView()
}
