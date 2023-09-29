//
//  MusicPlayerScreenInterfaces.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

protocol MusicPlayerView: AnyObject {
    func setPlayPauseButtonTitle(_ title: String)
}

protocol MusicPlayerViewModel {
    var view: MusicPlayerView? { get set }
    var title: String { get }
    
    func fetchMusicData()
    func playPauseButtonTapped()
}
