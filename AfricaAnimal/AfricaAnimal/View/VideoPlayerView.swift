//
//  VideoPlayerView.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 17/12/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer.init(url: Bundle.main.url(forResource: "cheetah", withExtension: "mp4")!))
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
