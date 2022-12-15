//
//  InsertFaceView.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 15/12/22.
//

import SwiftUI

struct InsertFaceView: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148,idealHeight: 168, maxHeight: 180)
        } //: GroupBox
    }
}

struct InsertFaceView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsertFaceView(animal: animal[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
