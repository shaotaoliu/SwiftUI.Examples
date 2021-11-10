import SwiftUI
import AVFoundation

struct MusicPlayerExample: View {
    @StateObject private var player = MusicPlayer()
    
    var body: some View {
        VStack {
            Button(action: {
                player.isPlaying.toggle()
            }, label: {
                Image(systemName: player.isPlaying ? "pause.circle" : "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(player.isPlaying ? .red : .green)
            })
        }
    }
    
    private class MusicPlayer: ObservableObject {
        @Published var isPlaying = false {
            didSet {
                if isPlaying {
                    player.play()
                } else {
                    player.pause()
                }
            }
        }
        
        private let player: AVAudioPlayer
        
        init() {
            let url = Bundle.main.url(forResource: "music.mp3", withExtension: nil)!
            player = try! AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            player.prepareToPlay()
        }
    }

}

struct MusicPlayerExample_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerExample()
    }
}
