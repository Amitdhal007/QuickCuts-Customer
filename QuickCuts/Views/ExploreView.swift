//
//  ExploreView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 09/09/24.
//

import SwiftUI
import CoreLocation
import MapKit

struct ExploreView: View {
    @State var cameraPosition: MapCameraPosition = .automatic
    @State var searchText: String = ""
    @State var results: [MKMapItem] = []
    @State var mapSelection: MKMapItem? = nil
    @State var showDetails: Bool = false
    @State var routeDisplaying: Bool = false
    @State var route: MKRoute?
    @State var routeDestination: MKMapItem?
    @State var getDirection: Bool = false
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        Map(position: $cameraPosition, selection: $mapSelection) {
            // Current location annotation
            if let currentLocation = locationManager.currentLocation {
                Annotation("My Location", coordinate: currentLocation) {
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.blue.opacity(0.25))
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.blue)
                    }
                }
            }
            
            // Results from the search
            ForEach(results, id: \.self) { result in
                if routeDisplaying {
                    if result == routeDestination {
                        let placeMark = result.placemark
                        Marker(placeMark.name ?? "", coordinate: placeMark.coordinate)
                    }
                } else {
                    let placeMark = result.placemark
                    Marker(placeMark.name ?? "", coordinate: placeMark.coordinate)
                }
            }
            
            // Route display
            if let route {
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 6)
            }
        }
        .mapControls {
            MapCompass()
            MapPitchToggle()
        }
        .mapStyle(.standard(elevation: .realistic))
        .overlay(alignment: .top) {
            TextField("Search Salons", text: $searchText)
                .font(.subheadline)
                .padding(12)
                .background(Color.white)
                .cornerRadius(8)
                .padding()
                .shadow(radius: 10)
        }
        .onSubmit(of: .text) {
            Task { await searchPlaces() }
        }
        .onChange(of: getDirection) { oldValue, newValue in
            if newValue {
                fetchRoute()
            }
        }
        .onChange(of: mapSelection) { oldValue, newValue in
            showDetails = newValue != nil
        }
        .onAppear {
            if let currentLocation = locationManager.currentLocation {
                cameraPosition = .region(.init(center: currentLocation, latitudinalMeters: 10000, longitudinalMeters: 10000))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let currentLocation = locationManager.currentLocation {
                    print("Current Location: \(currentLocation)")
                    cameraPosition = .region(.init(center: currentLocation, latitudinalMeters: 800, longitudinalMeters: 800))
                } else {
                    // Set a default region if current location is not available
                    cameraPosition = .region(.init(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), latitudinalMeters: 50000, longitudinalMeters: 50000))
                }
            }
        }
        .sheet(isPresented: $showDetails) {
            LocationDetailView(mapSelection: $mapSelection, show: $showDetails, getDirection: $getDirection)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(360)))
                .presentationCornerRadius(12)
        }
    }
    
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        // Use current location if available
        if let currentLocation = locationManager.currentLocation {
            request.region = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
        }
        
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
    
    func fetchRoute() {
        if let mapSelection, let currentLocation = locationManager.currentLocation {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: currentLocation))
            request.destination = mapSelection
            
            Task {
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                routeDestination = mapSelection
                
                withAnimation(.snappy) {
                    routeDisplaying = true
                    showDetails = false
                    
                    if let rect = route?.polyline.boundingMapRect, routeDisplaying {
                        cameraPosition = .rect(rect)
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
