//
//  BookingView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 09/09/24.
//

import SwiftUI

struct BookingView: View {
    @State var selectedSegment: Int = 0
    let segmentOptions: [String] = ["Upcoming", "Completed", "Cancelled"]
    
    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false) {
                VStack (spacing: 20) {
                    VStack(spacing: 16) {
                        Text("Booking History")
                            .font(.custom("Poppins-Regular", size: 24).bold())
                            .foregroundColor(.init("textColor"))
                    }
                    .padding(.top, 10)
                    
                    Picker("Options", selection: $selectedSegment) {
                        ForEach(0..<segmentOptions.count, id: \.self) { index in
                            Text(self.segmentOptions[index])
                                .tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.top, 10)
                    
                    if selectedSegment == 0 {
                        ForEach (0...4, id: \.self) { _ in
                            BookingHistoryComponent(bookingStatus: "Upcoming")
                        }
                    }
                    else if selectedSegment == 1 {
                        ForEach (0...4, id: \.self) { _ in
                            BookingHistoryComponent(bookingStatus: "Completed")
                        }
                    } 
                    else {
                        ForEach (0...4, id: \.self) { _ in
                            BookingHistoryComponent(bookingStatus: "Cancelled")
                        }
                    }
                }
            }
             .clipped()
            .padding(.horizontal, 16)
            // .navigationTitle("Booking History")
        }
    }
}

#Preview {
    BookingView()
}
