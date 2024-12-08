//
//  ReviewCard.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/09/24.
//

import SwiftUI

struct ReviewCard: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            HStack (spacing: 15) {
                VStack {
                    Image("rabbit")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                VStack (alignment: .leading, spacing: 5) {
                    Text("Akash Sharma")
                        .font(.custom("Poppins-Semibold", size: 16))
                        .foregroundStyle(Color("textColor"))
                    HStack {
                        Text("4.2 stars,")
                            .font(.custom("Poppins-Light", size: 14))
                            .foregroundStyle(.gray)
                        
                        Text("2023-09-15")
                            .font(.custom("Poppins-Light", size: 14))
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            VStack (alignment: .leading) {
                Text("Gread service and friendly staff. Highly recommended!")
                    .font(.custom("Poppins-Light", size: 14))
                    .foregroundStyle(Color("textColor"))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6).opacity(0.6))
        .cornerRadius(10)
    }
}

#Preview {
    ReviewCard()
}
