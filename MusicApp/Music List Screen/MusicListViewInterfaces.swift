//
//  MusicListViewInterfaces.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

protocol MusicListView: AnyObject {
    
}

protocol MusicListViewModel {
    var view: MusicListView? { get set }
}
