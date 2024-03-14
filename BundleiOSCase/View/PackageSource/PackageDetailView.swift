//
//  PackageDetailView.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 12.03.2024.
//

import SwiftUI

struct PackageDetailView: View {
    
    @ObservedObject var viewModel: PackageViewModel
    @ObservedObject var packageDetailData: PackageDetailData

    let packageId: Int

    init(packageId: Int, detailData: PackageDetailData) {
        self.packageId = packageId
        self.viewModel = PackageViewModel()
        self.packageDetailData = detailData
    }
    
    var body: some View {
        List {
            ForEach(viewModel.packageSources.indices, id: \.self) { index in
                PackageSourceCellView(packageSource: viewModel.packageSources[index])
                    .onTapGesture {
                        viewModel.toggleIsAdded(for: index)
                    }
            }
        }
        .onAppear {
            viewModel.fetchPackageSources(packageId: packageId)
        }
        .onDisappear{
            if packageDetailData.packageId == nil {
                packageDetailData.packageId = packageId
                packageDetailData.allItemsAdded = viewModel.areAllItemsAdded()
            }
        }
    }
}

