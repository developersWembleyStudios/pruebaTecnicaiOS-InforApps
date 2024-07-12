//
//  Labels.swift
//  InforApps
//
//  Created by Ruben Picado Garcia on 12/7/24.
//

import SwiftUI

struct LabelH1: View {
    var headline: String
    var subheadline: String
    var body: some View {
        HStack {
            Spacer().frame(width: 30)
            VStack(alignment: .leading) {
                Text(headline)
                    .font(.custom("Inter-Bold", size: 19))
                    .foregroundStyle(.black)
                    .bold()
                Spacer().frame(height: 5)
                Text(subheadline)
                    .font(.custom("Inter-Medium", size: 16))
                    .foregroundStyle(.black)
                    .lineLimit(3)
                Spacer().frame(height: 15)
            }
            Spacer()
        }
        Spacer().frame(height: 10)
    }
}

struct LabelHeader: View {
    var title: String
    var color: Color
    var body: some View {
        Spacer().frame(height: 20)
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color.opacity(0.2))
                    Text(title)
                        .font(.custom("Inter-ExtraBold", size: 24))
                        .foregroundStyle(.black)
                        .foregroundColor(.secondary)
                        .padding(10)
                }
            }
            Spacer()
        }
        .frame(height: 50)
        Spacer().frame(height: 20)
    }
}

struct ActAssignedButtonActionFinalization: View {
    var text: String
    var body: some View {
        HStack {
            Text(text)
                .foregroundStyle(.white)
                .font(.custom("Inter-Medium", size: 18))
                .tracking(1.0)
            Image(systemName: "apps.iphone")
                .padding(.top, 14)
                .padding(.bottom, 14)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(.blue)
            .cornerRadius(10)
    }
}

#Preview {
    ActAssignedButtonActionFinalization(text: "Website")
}
