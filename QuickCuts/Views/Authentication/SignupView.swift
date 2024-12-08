//
//  SignupView.swift
//  QuickCuts
//
//  Created by Akshay Jha on 07/09/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    @ObservedObject var userAuth: UserViewModel
    
    @FocusState private var focusedField: Field?
    @Environment(\.presentationMode) var presentationMode

    enum Field: Hashable {
        case userName
        case email
        case phoneNumber
        case password
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.init("textColor"))
                            .font(.title2)
                            
                    }
                
                    Text("Sign Up")
                        .font(.custom("Poppins-Regular", size: 24).bold())
                        .foregroundColor(.init("textColor"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.trailing, 22)
                    
                     
                }
                .padding([.top, .bottom], 10)
                
                VStack(alignment: .leading) {
                    Text("Username")
                        .font(.headline)
                    TextField("Enter your username", text: $userName)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .focused($focusedField, equals: .userName)
                }
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                    TextField("Enter your email", text: $email)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .focused($focusedField, equals: .email)
                }
                
                VStack(alignment: .leading) {
                    Text("Phone Number")
                        .font(.headline)
                    TextField("Enter your phone number", text: $phoneNumber)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .focused($focusedField, equals: .phoneNumber)
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.headline)
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .focused($focusedField, equals: .password)
                }
                
                Button(action: {
                    userAuth.registerUser(
                        name: userName,
                        email: email,
                        password: password,
                        phoneNumber: phoneNumber
                    )
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("buttonColor"))
                        .cornerRadius(10)
                }
                .padding(.top, 10)
            }
            .padding()
            .navigationBarHidden(true)
        }
        .onTapGesture {
            focusedField = nil 
        }
        .alert(isPresented: $userAuth.showErrorAlert) {
            Alert(
                title: Text("Error"),
                message: Text(userAuth.errorMsg ?? "An unknown error occurred."),
                dismissButton: .default(Text("OK"))
            )
        }
        .fullScreenCover(isPresented: $userAuth.isRegistered) {
            LoginView(userAuth: userAuth)
        }
    }
}



