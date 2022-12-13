//
//  CoverImageView.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 13/12/22.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            } //Loop
        } //Tab
        .tabViewStyle(.page)
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
