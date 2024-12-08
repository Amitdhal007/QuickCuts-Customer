//
//  SalonCard.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/09/24.
//

import SwiftUI

struct SalonCard: View {
    var body: some View {
        VStack {
            Image("food_14")
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .frame(width: 240, height: 160)
            
            
            
            VStack {
                Text("Salon Luxe")
                    .font(.custom("Poppins-Regular", size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.init("textColor"))
                
                Text("4.8 starts, 1.2 miles")
                    .font(.custom("Nunito-Medium", size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(.systemGray))
            }
            .padding(14)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 2)
        .frame(width: 240, height: 250)
        
    }
}

#Preview {
    SalonCard()
}
