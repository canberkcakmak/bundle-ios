//
//  PackageCellView.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 12.03.2024.
//

import SwiftUI
import Kingfisher

struct PackageCellView: View {
    @State private var isChecked: Bool = false
    var package: Package
    
    init(package: Package) {
        self._isChecked = State(initialValue: package.isAdded)
        self.package = package
    }

    var body: some View {
 
        ZStack(alignment: .bottomTrailing) {
          KFImage(URL(string: package.image))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .scaledToFill()
            .frame(maxHeight: 150)
            .cornerRadius(10)

          VStack(alignment: .center) {
             Text(package.name)
               .font(.title)
               .scaleEffect(0.8)
               .bold()
               .foregroundColor(.white)
              
              Text(package.description)
                  .font(.subheadline)
                  .opacity(0.8)
                  .foregroundColor(.white)
          }
          .frame(maxWidth: .infinity, maxHeight:  .infinity)
 
            
          Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 20, height: 20)
            .padding(10)
            .offset(x: -5, y: -5)
        }
        .listRowSeparator(.hidden)
        .padding(.horizontal, 10)
        .padding(.bottom, 5)
    }
}
