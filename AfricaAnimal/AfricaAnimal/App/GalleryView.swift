//
//  GalleryView.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 12/12/22.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - Properties
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    //Simle Grid Definition
    // 3 column layout
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
    
    //Efficient Grid Definition
//    let gridLayout: [GridItem] =  Array(repeating: GridItem(.flexible()), count: 3)
    
    //Dyanmic Gridlayout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    
    func gridSwitch() {
        gridLayout =  Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    //MARK: Body
    
    var body: some View {
        ScrollView(.vertical) {
            //MARK: Image
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 8))
           
            //MARK: Slider
            
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding()
                .onChange(of: gridColumn) { newValue in
                    print("New grid is", $gridColumn)
                    gridSwitch()
                }
            
            //MARK: Grid
            VStack(alignment: .center, spacing: 30) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                            }
                    } // Loop
                } // LazyVGrid
                .animation(.easeIn)
                .onAppear(){
                    gridSwitch()
                }
            } // VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
