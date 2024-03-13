//
//  ContentView.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 10.03.2024.
//

import SwiftUI

struct PackageListView: View {
    @ObservedObject var viewModel: PackageViewModel

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
                    List(viewModel.packages) { package in
                        PackageCellView(package: package)
                            .onTapGesture {
                                viewModel.navigateToDetail(id: package.id)

                            }
                    }
                    
                    .listStyle(.plain)
                    .navigationBarTitle("Bundle", displayMode: .large)
                    .sheet(isPresented: $viewModel.isDetailPresented) {
                        if let _id = viewModel.selectedPackageId{
                            PackageDetailView(packageId: _id)
                        }
                    }
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
        PackageListView()
    }
}

#Preview {
    PackageListView()
}
