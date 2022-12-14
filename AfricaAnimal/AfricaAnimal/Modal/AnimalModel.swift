//
//  AnimalModel.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 14/12/22.
//

import Foundation

struct Animal: Codable, Identifiable {
    let id, name, headline, description, link, image: String
    let gallery, fact: [String]
}
