//
//  PackageDetailView.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 12.03.2024.
//

import SwiftUI

struct PackageDetailView: View {
   @ObservedObject var viewModel: PackageViewModel
   let packageId: Int

   init(packageId: Int) {
       self.packageId = packageId
       self.viewModel = PackageViewModel()
   }

   var body: some View {
       List(viewModel.packageSources) { sources in
           PackageSourceCellView(sources: sources)
               .onTapGesture {

               }
       }
       .navigationTitle("Paket Kaynakları")
       .onAppear {
           viewModel.fetchPackageSources(packageId: packageId)
       }
   }
}

