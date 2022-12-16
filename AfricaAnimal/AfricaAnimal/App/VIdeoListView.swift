//
//  VIdeoListView.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 12/12/22.
//

import SwiftUI

struct VIdeoListView: View {
    
    @State var video: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(video) { item in
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                } //: Loop
            }
            .listStyle(.inset)
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //shuffle vides
                        video.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        } //: NavigationView
    }
}

struct VIdeoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        VIdeoListView()
    }
}
