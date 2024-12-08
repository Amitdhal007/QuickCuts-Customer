//
//  LocationDetailView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 12/09/24.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @Binding var mapSelection: MKMapItem?
    @Binding var show: Bool
    @Binding var getDirection: Bool
    @State var lookAroundScene: MKLookAroundScene?
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text(mapSelection?.placemark.name ?? "Luke Salon")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(mapSelection?.placemark.title ?? "202 A street No 18 Gurur Nanak Nagar, Patiala")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .lineLimit(2)
                        .padding(.trailing)
                }
                
                Spacer()
                
                Button(action: {
                    show.toggle()
                    mapSelection = nil
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(.systemGray4))
                })
            }
            .padding(.top, 25)
            
//            if let scene = lookAroundScene {
//                LookAroundPreview(initialScene: scene)
//                    .frame(height: 200)
//                    .cornerRadius(12)
//            } else {
//                ContentUnavailableView("No preview available", systemImage: "eye.slash")
//            }
            
            Image("food_14")
                .resizable()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            HStack (spacing: 12) {
                Button(action: {}, label: {
                    Text("More Details")
                        .font(.headline)
                        .frame(width: 172, height: 48)
                        .background(Color("buttonColor"))
                        .cornerRadius(12)
                })
                
                Button(action: {
                    getDirection = true
                    show = false
                }, label: {
                    Text("Get Direction")
                        .font(.headline)
                        .frame(width: 172, height: 48)
                        .background(Color("buttonColor"))
                        .cornerRadius(12)
                })
            }
            .padding(.top, 10)
            .foregroundColor(.white)
        }
        .padding([.leading, .bottom, .trailing], 16)
        .onAppear {
            fetchLookAroundPreview()
        }
        .onChange(of: mapSelection) { oldValue, newValue in
            fetchLookAroundPreview()
        }
    }
}

extension LocationDetailView {
    func fetchLookAroundPreview(){
        if let mapSelection {
            lookAroundScene = nil
            Task {
                let request = MKLookAroundSceneRequest(mapItem: mapSelection)
                lookAroundScene = try? await request.scene
            }
        }
    }
}

#Preview {
    LocationDetailView(mapSelection: .constant(nil), show: .constant(false), getDirection: .constant(false))
}
