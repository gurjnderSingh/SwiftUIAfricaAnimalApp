//
//  AnimalDetailView.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 14/12/22.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - Properties
    let animal: Animal
    
    //MARK: - View
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 20) {
                //HERO Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                //Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(x:10, y: 24)
                    )
                    //HEADLINE
            }
            .navigationBarTitle("Learn about \(animal.name)",displayMode: .inline)
        }
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}
