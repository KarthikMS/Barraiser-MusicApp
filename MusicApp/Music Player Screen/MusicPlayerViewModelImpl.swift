//
//  MusicPlayerViewModelImpl.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

import Foundation
import AVFoundation

final class MusicPlayerViewModelImpl: MusicPlayerViewModel {
    
    // MARK: - MusicPlayerViewModel Properties
    
    weak var view: MusicPlayerView?
    let title: String
    
    // MARK: - Propeties
    
    private let music: Music
    private var audioPlayer: AVAudioPlayer?
    
    // MARK: - Init
    
    init(music: Music) {
        self.music = music
        self.title = music.title
    }
    
}

// MARK: - // MARK: MusicPlayerViewModel

extension MusicPlayerViewModelImpl {

    func fetchMusicData() {
        // TODO:  Mocking data for now.
        guard let path = Bundle.main.path(forResource: "Kalimba", ofType:"mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    func playPauseButtonTapped() {
        guard let audioPlayer else { return }
        if !audioPlayer.isPlaying {
            audioPlayer.play()
            view?.setPlayPauseButtonTitle("Pause")
        } else {
            audioPlayer.pause()
            view?.setPlayPauseButtonTitle("Play")
        }
    }
    
}
