//
//  PaymentSuccessfullView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 15/09/24.
//

import SwiftUI

struct PaymentSuccessfullView: View {
    var body: some View {
        VStack {
            Spacer()
            
            // Success Icon
            Circle()
                .fill(Color.green)
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                )
            
            // Recharge Amount
            Text("₹500")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.green)
                .padding(.bottom, 10)
            
            // Fastag Information
            Text("Recharge Successful to")
                .foregroundColor(.gray)
                .font(.custom("Poppins-Regular", size: 18))
                .padding(.bottom, 3)
            
            Text("MH01GO1005 vehicle fastag.")
                .font(.custom("Poppins-Bold", size: 18))
                .foregroundColor(Color("buttonColor"))
                .padding(.bottom, 40)
            
            Spacer()
            
            // Buttons
            VStack(spacing: 16) {
                Button(action: {
                    // Action for "Download Receipt"
                }) {
                    Text("GO TO HOME")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("buttonColor"))
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
    }
}

struct FastagRechargeSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSuccessfullView()
    }
}
