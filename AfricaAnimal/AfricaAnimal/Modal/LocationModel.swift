//
//  LocationModel.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 17/12/22.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    var id, name, image: String
    var latitude, longitude: Double
    
    //Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
