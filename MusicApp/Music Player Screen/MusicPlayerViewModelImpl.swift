//
//  MusicPlayerViewModelImpl.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

import Foundation

final class MusicPlayerViewModelImpl: MusicPlayerViewModel {
    
    // MARK: - MusicPlayerViewModel Properties
    
    weak var view: MusicPlayerView?
    let title: String
    
    // MARK: - Propeties
    
    private let music: Music
    
    // MARK: - Init
    
    init(music: Music) {
        self.music = music
        self.title = music.title
    }
    
}
