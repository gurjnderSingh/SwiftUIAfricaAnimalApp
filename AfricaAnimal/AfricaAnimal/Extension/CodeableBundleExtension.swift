//
//  CodeableBundleExtension.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 13/12/22.
//

import Foundation

extension Bundle {
    func decode(_ file: String)-> [CoverImage] {
        // Locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        
        // create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to locate \(file) in bundle")
        }

        // create a decoder
        let decoder = JSONDecoder()
        
        // create a property for the decoded data
        guard let loadedData = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("failed to locate \(file) in bundle")
        }

        //return the ready-to-use data
        return loadedData
    }
}
