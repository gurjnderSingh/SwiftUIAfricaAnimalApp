//
//  MapView.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 12/12/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinate = CLLocationCoordinate2D.init(latitude: 6.60, longitude: 16.43)
        var mapZoomLevel = MKCoordinateSpan.init(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion.init(center: mapCoordinate, span: mapZoomLevel)
        return mapRegion
    }()
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // (A) PIN: OLD Style (always static
           // MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: (New Style) (always static
//             MapMarker(coordinate: item.location)
            
            // (C) Custom basic annotations (iteractive)
            MapAnnotation(coordinate: item.location) {
                Button {
                    print("Location is", item.location)
                } label: {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }

            } // Annotation
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
