//
//  PaymentOptionView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 15/09/24.
//

import SwiftUI

struct paymentMethodOption: View {
    var imageName: String
    var title: String
    var detail: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(Color("buttonColor"))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .padding(.leading, 10)
                if !detail.isEmpty {
                    Text(detail)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            Image(systemName: "circle")
                .foregroundColor(Color("buttonColor"))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 2)
    }
}


