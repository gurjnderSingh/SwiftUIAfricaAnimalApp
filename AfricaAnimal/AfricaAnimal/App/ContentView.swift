//
//  ContentView.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive = false
    //MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    } //: List
                } else {
                    Text("GridView Active")
                } //: Condition
            } // Group
            .navigationBarTitle("Africa",displayMode: .large)
            .toolbar {
                HStack(spacing: 16) {
                    Button {
                        isGridViewActive = false
                        haptics.impactOccurred()
                    } label: {
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .primary : .accentColor)
                    }
                    
                    //GRID
                    Button {
                        isGridViewActive = true
                        haptics.impactOccurred()
                    } label: {
                        Image(systemName: "square.grid.2x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .accentColor : .primary)
                    }
                }
            }
        } //: Navigation
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
