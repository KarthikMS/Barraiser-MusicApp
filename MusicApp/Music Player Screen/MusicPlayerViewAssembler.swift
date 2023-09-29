//
//  MusicPlayerViewAssembler.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

struct MusicPlayerViewAssembler {
    
    static func getView(for music: Music) -> MusicPlayerViewController {
        let viewModel = MusicPlayerViewModelImpl(music: music)
        let viewController = MusicPlayerViewController(viewModel: viewModel)
        viewModel.view = viewController
        return viewController
    }
    
}
