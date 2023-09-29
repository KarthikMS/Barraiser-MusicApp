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
    
    // MARK: - View Elements
    
    private lazy var playPauseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    init(viewModel: MusicPlayerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = viewModel.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        viewModel.fetchMusicData()
    }
    
    // MARK: - Setup
    
    private func addSubviews() {
        view.addSubview(playPauseButton)
        NSLayoutConstraint.activate([
            playPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playPauseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Button Actions
    
    @objc private func playPauseButtonTapped() {
        viewModel.playPauseButtonTapped()
    }
    
}

// MARK: - MusicPlayerView

extension MusicPlayerViewController {
    
    func setPlayPauseButtonTitle(_ title: String) {
        playPauseButton.setTitle(title, for: .normal)
    }
    
}
