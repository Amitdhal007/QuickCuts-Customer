//
//  AuthModel.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 21/11/24.
//

import Foundation

// Root response model
struct AuthResponse: Codable {
    let success: Bool
    let token: String
    let user: User
}

// User model
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let password: String
    let profilePicture: String?
    let phoneNumber: String
    let createdAt: String
    let updatedAt: String
    let version: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case email
        case password
        case profilePicture
        case phoneNumber
        case createdAt
        case updatedAt
        case version = "__v"
    }
}
