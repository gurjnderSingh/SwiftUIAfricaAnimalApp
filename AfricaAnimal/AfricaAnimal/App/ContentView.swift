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
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]  //Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var gridColumn = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - Function
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number- \(gridColumn)")
        
        //Toolbar Image
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
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
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: Link
                            } //: Loop
                        } //: Grid
                        .padding(10)
                        .animation(.easeIn)
                    } //: Scroll
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
                        gridSwitch()
                    } label: {
                        Image(systemName: toolbarIcon)
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
