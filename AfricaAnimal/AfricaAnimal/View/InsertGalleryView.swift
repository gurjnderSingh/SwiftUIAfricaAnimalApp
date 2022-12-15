//
//  InsertGalleryView.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 15/12/22.
//

import SwiftUI

struct InsertGalleryView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 12) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }
        }
    }
}

struct InsertGalleryView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsertGalleryView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
