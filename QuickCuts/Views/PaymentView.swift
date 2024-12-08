//
//  PaymentView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 14/09/24.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.init("textColor"))
                            .font(.title2)
                            
                    }
                
                    Text("Payment")
                        .font(.custom("Poppins-Regular", size: 24).bold())
                        .foregroundColor(.init("textColor"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.trailing, 22)
                    
                     
                }
                .padding(.top, 10)
                
                // Payment Method Section
                Text("Payment Method")
                    .font(.custom("Poppins-Regular", size: 20).bold())
                    .foregroundColor(.init("textColor"))
                    .padding(.top, 10)
                
                VStack(spacing: 15) {
                    paymentMethodOption(imageName: "creditcard.fill", title: "BHIM UPI", detail: "")
                    paymentMethodOption(imageName: "dollarsign.circle.fill", title: "Cash on Delivery", detail: "")
                }
                
                // Booking Info Section
                Text("Appointment Details")
                    .font(.custom("Poppins-Regular", size: 20).bold())
                    .foregroundColor(.init("textColor"))
                    .padding(.top, 10)
                
                HStack {
                    VStack {
                        Text("Service")
                            .foregroundColor(.gray)
                        Text("Haircut & Styling")
                            .font(.headline)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Date")
                            .foregroundColor(.gray)
                        Text("Sep 20, 2024")
                            .font(.headline)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 2)
                
                
                // Subtotal and Total Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Subtotal:")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("$80")
                            .font(.headline)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Total:")
                            .font(.headline)
                        Spacer()
                        Text("$80")
                            .font(.headline)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 2)
                
                // Pay Now Button
                Button(action: {
                    // Add pay now action here
                }) {
                    Text("Confirm Booking")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("buttonColor"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical)
            }
            .padding(.horizontal, 16)
        }
        .clipped()
    }
    
}

struct PaymentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
