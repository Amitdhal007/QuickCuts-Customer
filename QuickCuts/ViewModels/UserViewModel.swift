//
//  UserViewModel.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 20/11/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var isRegistered = false
    @Published var isLoggedIn = false
    @Published var errorMsg: String? = nil
    @Published var showErrorAlert: Bool = false
    
    let baseUrl: String = "http://192.168.1.2:7400/api/auth/user"
    
    
    func registerUser(name: String, email: String, password: String, phoneNumber: String) {
        guard !name.isEmpty else {
            showError(message: "Username cannot be empty.")
            return
        }
        
        guard !email.isEmpty else {
            showError(message: "Email cannot be empty.")
            return
        }
        
        guard !password.isEmpty else {
            showError(message: "Password cannot be empty.")
            return
        }
        
        guard !phoneNumber.isEmpty else {
            showError(message: "Phone number cannot be empty.")
            return
        }
        
        guard let url = URL(string: baseUrl + "/register") else {
            showError(message: "Invalid URL for registration.")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let bodyData: [String: Any] = [
            "name": name,
            "email": email,
            "password": password,
            "phoneNumber": phoneNumber
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: bodyData, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            showError(message: "Failed to encode request data.")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.showError(message: "Network error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.showError(message: "Invalid server response.")
                return
            }
            
            DispatchQueue.main.async {
                if httpResponse.statusCode == 201 {
                    self.isRegistered = true
                    self.errorMsg = nil
                    self.showErrorAlert = false
                    print("User registered successfully.")
                } else {
                    self.showError(message: "Registration failed: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
                }
            }
        }.resume()
    }
    
    func loginUser(email: String, password: String) {
        guard !email.isEmpty else {
            showError(message: "Email cannot be empty.")
            return
        }
        
        guard !password.isEmpty else {
            showError(message: "Password cannot be empty.")
            return
        }
        
        guard let url = URL(string: baseUrl + "/login") else {
            showError(message: "Invalid URL for login.")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let bodyData = ["email": email, "password": password]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: bodyData, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            showError(message: "Failed to encode request data.")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.showError(message: "Network error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.showError(message: "Invalid server response.")
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                self.showError(message: "Login failed: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
                return
            }
            
            guard let data = data, !data.isEmpty else {
                self.showError(message: "No data received from server.")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                guard decodedResponse.success else {
                    self.showError(message: "Login failed: Invalid credentials.")
                    return
                }
                
                DispatchQueue.main.async {
                    UserDefaults.standard.set(decodedResponse.token, forKey: "accessToken")
                    UserDefaults.standard.set(decodedResponse.user.id, forKey: "userID")
                    UserDefaults.standard.set(decodedResponse.user.email, forKey: "email")
                    UserDefaults.standard.set(decodedResponse.user.name, forKey: "userName")
                    UserDefaults.standard.set(decodedResponse.user.phoneNumber, forKey: "phoneNumber")
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    
                    self.isLoggedIn = true
                }
            } catch {
                self.showError(message: "Failed to parse server response.")
            }
        }.resume()
    }
    
    func logOutUser() {
        guard let url = URL(string: baseUrl + "/logout") else {
            showError(message: "Invalid Logout URL.")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let userId = UserDefaults.standard.string(forKey: "userID") else {
            showError(message: "User ID not found. Please log in again.")
            return
        }
        
        let bodyData = ["userId": userId]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: bodyData, options: [])
        } catch {
            showError(message: "Failed to encode request data.")
            return
        }
        
        if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        } else {
            showError(message: "Access token not found. Please log in again.")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.showError(message: "Network error during logout: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                self.showError(message: "Invalid server response during logout.")
                return
            }
            
            DispatchQueue.main.async {
                if httpResponse.statusCode == 200 {
                    UserDefaults.standard.removeObject(forKey: "accessToken")
                    UserDefaults.standard.removeObject(forKey: "userID")
                    UserDefaults.standard.removeObject(forKey: "email")
                    UserDefaults.standard.removeObject(forKey: "userName")
                    UserDefaults.standard.removeObject(forKey: "phoneNumber")
                    UserDefaults.standard.set(false, forKey: "isLoggedIn")
                    
                    self.isLoggedIn = false
                    print("User logged out successfully.")
                } else {
                    self.showError(message: "Logout failed with status code: \(httpResponse.statusCode).")
                }
            }
        }.resume()
    }

    
    private func showError(message: String) {
        DispatchQueue.main.async {
            self.errorMsg = message
            self.showErrorAlert = true
        }
    }
}

