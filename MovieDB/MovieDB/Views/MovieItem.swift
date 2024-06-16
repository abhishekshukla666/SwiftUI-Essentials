//
//  MovieItem.swift
//  MovieDB
//
//  Created by Abhishek Shukla on 09/06/24.
//

import SwiftUI

struct MovieItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 300, height: 209)
            VStack(alignment: .leading, spacing: 4) {
                Text("Aladdin")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Description")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 40)
            }
            .padding(.leading, 16)
        }
    }
}

#Preview {
    MovieItem()
}
