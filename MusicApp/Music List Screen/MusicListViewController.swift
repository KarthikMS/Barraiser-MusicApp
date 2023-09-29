//
//  MusicListViewController.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

import UIKit

class MusicListViewController: UITableViewController {
    
    // MARK: - Dependencies
    
    private let viewModel: MusicListViewModel
    
    // MARK: - Init
    
    init(viewModel: MusicListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Top Music"
    }


}

