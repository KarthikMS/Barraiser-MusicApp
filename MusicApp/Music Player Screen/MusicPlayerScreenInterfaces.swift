//
//  MusicPlayerScreenInterfaces.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

protocol MusicPlayerView: AnyObject {
    
}

protocol MusicPlayerViewModel {
    var view: MusicPlayerView? { get set }
    var title: String { get }
    
    func fetchMusicData()
}
