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
        Map(coordinateRegion: $region,showsUserLocation: true ,annotationItems: locations) { item in
            
            // (B) MARKER: (New Style) (always static
//             MapMarker(coordinate: item.location)
            
            // (C) Custom basic annotations (iteractive)
//            MapAnnotation(coordinate: item.location) {
//                Button {
//                    print("Location is", item.location)
//                } label: {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 30, height: 30)
//                }
//
//            } // Annotation
            
            // (C) Custom basic annotations (iteractive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } //: Map
        .overlay (
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack (alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                    }
                    Divider()
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                    }
                }
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
