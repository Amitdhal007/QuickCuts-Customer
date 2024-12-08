//
//  HomeView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 07/09/24.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    let gridItems = [GridItem(.flexible(minimum: 240, maximum: 260))]
    
    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false) {
                
                VStack(spacing: 16) {
                    Text("Home")
                        .font(.custom("Poppins-Bold", size: 26))
                        .foregroundColor(.init("textColor"))
                }
                .padding(.top, 10)
                
                CustomSearchBar(searchText: $searchText, placeholder: "Search for salons")
                    // .padding(.top, 20)
                
                VStack (spacing: 15) {
                    
                    Text("Top Salons")
                        .font(.custom("Poppins-Bold", size: 24))
                        .foregroundColor(.init("textColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: gridItems, spacing: 15) {
                            ForEach (0...5, id: \.self) { _ in
                                NavigationLink(destination: SalonDetailView(), label: {
                                    SalonCard()
                                })
                            }
                        }
                    }
                    
                    Text("Nearby Salons")
                        .font(.custom("Poppins-Bold", size: 24))
                        .foregroundColor(.init("textColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: gridItems, spacing: 15) {
                            ForEach (0...5, id: \.self) { _ in
                                SalonCard()
                            }
                        }
                    }
                }
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .background(Color(.systemBackground))
            .padding(.horizontal, 16)
            .clipped()
        }
    }
}


#Preview {
    HomeView()
}
