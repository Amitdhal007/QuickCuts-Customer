//
//  TabBarView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/09/24.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var userAuth: UserViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            
            BookingView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Bookings")
                }
            
            ProfileView(userAuth: userAuth)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

