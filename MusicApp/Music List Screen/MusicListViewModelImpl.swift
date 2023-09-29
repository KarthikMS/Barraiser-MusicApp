//
//  MusicListViewModelImpl.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

final class MusicListViewModelImpl: MusicListViewModel {
    
    // MARK: - MusicListViewModel Properties
    
    weak var view: MusicListView?
    
    // MARK: - Dependencies
    
    private let apiManager: ApiManaging
    
    // MARK: - Init
    
    init(apiManager: ApiManaging = ApiManager()) {
        self.apiManager = apiManager
    }
}
