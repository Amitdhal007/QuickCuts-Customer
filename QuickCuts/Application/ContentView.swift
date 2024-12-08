//
//  ContentView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userAuth: UserViewModel = UserViewModel()
    
    var body: some View {
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            TabBarView(userAuth: userAuth)
        }
        else {
            InitialView(userAuth: userAuth)
        }
    }
}

#Preview {
    ContentView()
}
