//
//  InserMapview.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 15/12/22.
//

import SwiftUI
import MapKit

struct InsertMapView: View {
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 6.06, longitude: 16.3453), span: MKCoordinateSpan.init(latitudeDelta: 60.0, longitudeDelta: 60.60))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    } //: HStack
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.accentColor
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                } //: Navigaiton
                    .padding(12)
                ,alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsertMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsertMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
