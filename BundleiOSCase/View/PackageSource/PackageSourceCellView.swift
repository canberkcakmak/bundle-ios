//
//  PackageSourceCellView.swift
//  BundleiOSCase
//
//  Created by Canberk Çakmak on 13.03.2024.
//

import SwiftUI

struct PackageSourceCellView: View {
    @State private var isChecked: Bool = false
    var sources: PackageSource
    
    init(sources: PackageSource) {
        self._isChecked = State(initialValue: sources.isAdded)
        self.sources = sources
    }
    
    var body: some View {
        HStack {
            Text(sources.name)
                .font(.subheadline)
                .opacity(0.8)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
              .resizable()
              .foregroundColor(.black)
              .frame(width: 20, height: 20)
              .padding(10)
        }
    }
}
