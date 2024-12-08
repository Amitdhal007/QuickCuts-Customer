//
//  ReviewView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 14/09/24.
//

import SwiftUI

struct ReviewView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var reviewText: String = ""
    @State private var rating: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Header with navigation and title
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.init("textColor"))
                            .font(.title2)
                            
                    }
                
                    Text("Review")
                        .font(.custom("Poppins-Regular", size: 24).bold())
                        .foregroundColor(.init("textColor"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.trailing, 22)
                    
                     
                }
                .padding(.top, 10)
                
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

                
                VStack (alignment: .leading) {
                    
                    VStack(alignment: .leading) {
                        
                        Text("write your reviews")
                            .font(.custom("Poppins-Regular", size: 20).bold())
                            .foregroundColor(.init("textColor"))
                        
                        // Review Input
                        VStack(alignment: .leading) {
                                TextEditor(text: $reviewText)
                                    .scrollContentBackground(.hidden)
                                    .frame(height: 150)
                                    .padding(.leading, 6)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .foregroundColor(.black.opacity(0.7))
                        }
                    }
                    .padding(.top, 10)
                    
                    // Star Rating System
                    HStack {
                        ForEach(1..<6) { star in
                            Button(action: {
                                rating = star
                            }) {
                                Image(systemName: star <= rating ? "star.fill" : "star")
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    .padding(.top, 5)
                    
                    // Submit Button
                    Button(action: {
                        // Action for submit button
                    }) {
                        Text("Submit")
                            // .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .font(.custom("Poppins-Semibold", size: 17))
                            .padding()
                            .background(Color("buttonColor"))
                            .cornerRadius(10)
                            .padding(.top, 30)
                    }

                }
                 .padding(.top, 5)
            }
            .padding(.horizontal, 16)
        }
        .clipped()
        .navigationBarHidden(true)
    }
}

struct ReviewPageView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}

