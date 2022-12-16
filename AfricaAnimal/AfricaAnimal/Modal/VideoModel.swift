//
//  VideoModel.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 16/12/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id, name, headline: String
    
    //Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
