//
//  CancelBookingView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 14/09/24.
//

import SwiftUI

struct CancelBookingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var reason: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Back button and Title
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.init("textColor"))
                            .font(.title2)
                            
                    }
                
                    Text("Cancel")
                        .font(.custom("Poppins-Regular", size: 24).bold())
                        .foregroundColor(.init("textColor"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.trailing, 22)
                    
                     
                }
                .padding(.top, 10)

                // Appointment Details
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


                // Reason for Cancellation
                VStack(alignment: .leading) {
                    
                    Text("Write cancellation reason")
                        .font(.custom("Poppins-Regular", size: 20).bold())
                        .foregroundColor(.init("textColor"))
                    
                    // Review Input
                    VStack(alignment: .leading) {
                            TextEditor(text: $reason)
                            .scrollContentBackground(.hidden)
                                .frame(height: 150)
                                .padding(.leading, 6)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .foregroundColor(.black.opacity(0.7))
                                
                    }
                }
                .padding(.top, 10)

                // Cancel Button
                Button(action: {
                    // Action to cancel appointment
                }) {
                    Text("Cancel Appointment")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color("buttonColor"))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationBarHidden(true)
        .clipped()
    }
}

struct CancelAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        CancelBookingView()
    }
}

