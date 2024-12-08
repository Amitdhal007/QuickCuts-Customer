//
//  CompletedBookingView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 15/09/24.
//

import SwiftUI

struct CompletedBookingView: View {
    var body: some View {
        HStack (spacing: 20) {
            Image("food_14")
                .resizable()
                .frame(width: 100, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            VStack (alignment: .leading, spacing: 15) {
                VStack {
                    Text("Salon Luxe")
                        .font(.custom("Poppins-Semibold", size: 18))
                        .foregroundStyle(Color("textColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("5 Sep, 10:30 AM")
                        .font(.custom("Poppins-Light", size: 14))
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    
                    Text("Completed")
                        .font(.custom("Poppins-Bold", size: 18))
                        .foregroundStyle(Color("buttonColor"))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Review")
                            .font(.custom("Poppins-Regular", size: 16))
                            .padding([.top, .bottom], 6)
                            .padding([.leading, .trailing], 10)
                            .background(Color("buttonColor"))
                            .foregroundStyle(.white)
                            .cornerRadius(8)
                    })
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6).opacity(0.6))
        .cornerRadius(10)
    }
}

#Preview {
    CompletedBookingView()
}
