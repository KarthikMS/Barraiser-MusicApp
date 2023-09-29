//
//  MusicListViewInterfaces.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

enum MusicListViewState {
    case loading
    case loaded(musicList: [Music])
    case error
    
    var musicList: [Music] {
        switch self {
        case .loading, .error:
            return []
        case .loaded(let musicList):
            return musicList
        }
    }
}

protocol MusicListView: AnyObject {
    func render(state: MusicListViewState)
}

protocol MusicListViewModel {
    var view: MusicListView? { get set }
    var state: MusicListViewState { get }
    
    func fetchMusicList()
}
