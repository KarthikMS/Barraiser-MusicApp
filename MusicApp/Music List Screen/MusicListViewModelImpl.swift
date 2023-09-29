//
//  MusicListViewModelImpl.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

import Foundation

final class MusicListViewModelImpl: MusicListViewModel {
    
    // MARK: - Dependencies
    
    private let apiManager: ApiManaging
    
    // MARK: - Properties
    
    var state: MusicListViewState = .loading {
        didSet {
            DispatchQueue.main.async {
                self.view?.render(state: self.state)
            }
        }
    }
    
    // MARK: - MusicListViewModel Properties
    
    weak var view: MusicListView?
    
    // MARK: - Init
    
    init(apiManager: ApiManaging = ApiManager()) {
        self.apiManager = apiManager
    }
}

// MARK: - MusicListViewModel

extension MusicListViewModelImpl {
    
    func fetchMusicList() {
        state = .loading
        
        apiManager.execute(Music.fetchList) { [weak self] result in
            self?.state = switch result {
            case .success(let musicList):
                    .loaded(musicList: musicList)
            case .failure:
                    .error
            }
            
        }
    }
    
}
