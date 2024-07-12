//
//  Labels.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 12/7/24.
//

import SwiftUI

struct LabelTitle: View {
    var title: String
    var body: some View {
        HStack {
            Spacer().frame(width: 30)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 30))
                    .foregroundStyle(.gray)
                    .bold()
                Spacer().frame(height: 15)
            }
            Spacer()
        }
    }
}

struct LabelH1: View {
    var headline: String
    var subheadline: String
    var body: some View {
        HStack {
            Spacer().frame(width: 30)
            VStack(alignment: .leading) {
                Text(headline)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .bold()
                Text(subheadline)
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .lineLimit(3)
                Spacer().frame(height: 10)
            }
            Spacer()
        }
    }
}

#Preview {
    LabelTitle(title: "Titulo")
}
