//
//  CodeableBundleExtension.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 13/12/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String)-> T {
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
//        guard let loadedData = try? decoder.decode(T.self, from: data) else {
//            fatalError("failed to locate \(file) in bundle")
//        }
        
        do {
            let loadedData = try decoder.decode(T.self, from: data)
            return loadedData
        } catch {
            print(error)
            fatalError("failed to locate \(file) in bundle")
        }

        //return the ready-to-use data
//        return loadedData
    }
}
