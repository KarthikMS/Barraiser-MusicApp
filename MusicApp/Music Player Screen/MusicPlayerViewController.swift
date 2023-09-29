//
//  MusicPlayerViewController.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

import UIKit

final class MusicPlayerViewController: UIViewController, MusicPlayerView {
    
    // MARK: - Dependencies
    
    private let viewModel: MusicPlayerViewModel
    
    // MARK: - Init
    
    init(viewModel: MusicPlayerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMusicData()
    }
    
}
