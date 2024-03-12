//
//  ContentView.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 10.03.2024.
//

import SwiftUI

struct PackageListView: View {
    @ObservedObject var viewModel: PackageViewModel

    init(viewModel: PackageViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("")
                        .progressViewStyle(CircularProgressViewStyle(tint: .red))
                        .scaleEffect(1.5)
                } else {
                    List(viewModel.packages) { package in
                        PackageCellView(package: package)
                            .onTapGesture {
                                //    $viewModel.navigateToDetail(package: package)
                            }
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    .navigationBarTitle("Bundle", displayMode: .large)
                }
            }
            .onAppear {
                viewModel.fetchPackages()
            }
        }
    }
}

struct PackageListView_Previews: PreviewProvider {
    static var previews: some View {
        PackageListView(viewModel: PackageViewModel())
    }
}

#Preview {
    PackageListView(viewModel: PackageViewModel())
}
