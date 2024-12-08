//
//  ProfileView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 09/09/24.
//

import SwiftUI


struct ProfileView: View {
    @ObservedObject var userAuth: UserViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("textColor"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding([.trailing, .top])

                VStack(spacing: 10) {
                    Image("rabbit")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 120, height: 120)
                    
                    Text(UserDefaults.standard.string(forKey: "userName") ?? "John Doe")
                        .font(.custom("Poppins-Regular", size: 24).bold())
                        .foregroundColor(Color("textColor"))
                    
                    Text(UserDefaults.standard.string(forKey: "email") ?? "john.doe@gmail.com")
                        .font(.custom("Poppins-Regular", size: 16))
                        .foregroundColor(Color("textColor"))
                }
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Account Settings")
                    .font(.custom("Poppins-Regular", size: 24).bold())
                    .foregroundColor(Color("textColor"))
                    .padding(.horizontal)
                    .padding(.bottom)
                
                VStack(spacing: 0) {
                    NavigationLink(destination: Text("My Bookings")) {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(Color("textColor"))
                            Text("My Bookings")
                                .font(.custom("Poppins-Regular", size: 18))
                                .foregroundColor(Color("textColor"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }

                    Divider()
                    
                    NavigationLink(destination: Text("Payment Methods")) {
                        HStack {
                            Image(systemName: "creditcard")
                                .foregroundColor(Color("textColor"))
                            Text("Payment Methods")
                                .font(.custom("Poppins-Regular", size: 18))
                                .foregroundColor(Color("textColor"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }

                    Divider()
                    
                    NavigationLink(destination: Text("Edit Profile")) {
                        HStack {
                            Image(systemName: "pencil")
                                .foregroundColor(Color("textColor"))
                            Text("Edit Profile")
                                .font(.custom("Poppins-Regular", size: 18))
                                .foregroundColor(Color("textColor"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }

                    Divider()
                    
                    NavigationLink(destination: Text("Settings")) {
                        HStack {
                            Image(systemName: "gearshape")
                                .foregroundColor(Color("textColor"))
                            Text("Settings")
                                .font(.custom("Poppins-Regular", size: 18))
                                .foregroundColor(Color("textColor"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button(action: {
                    userAuth.logOutUser()
                }) {
                    Text("LogOut")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("buttonColor"))
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                        .padding(.top, 30)
                }
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .clipped()
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
        .alert(isPresented: $userAuth.showErrorAlert) {
            Alert(
                title: Text("Error"),
                message: Text(userAuth.errorMsg ?? "An unknown error occurred."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

