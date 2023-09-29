//
//  MusicListViewController.swift
//  MusicApp
//
//  Created by Karthik Maharajan Skandarajah on 29/09/2023.
//

import UIKit

class MusicListViewController: UITableViewController, MusicListView {
    
    // MARK: - Dependencies
    
    private let viewModel: MusicListViewModel
    
    // MARK: - Init
    
    init(viewModel: MusicListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setUpTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Top Music"
        viewModel.fetchMusicList()
    }

    // MARK: - Setup
    
    private func setUpTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

// MARK: - MusicListView

extension MusicListViewController {
    
    func render(state: MusicListViewState) {
        switch state {
        case .loading:
            showLoading()
        case .loaded:            
            tableView.reloadData()
        case .error:
            showError()
        }
    }
    
    private func showLoading() {
        // TODO:
    }
    
    private func showError() {
        // TODO:
    }
    
}


// MARK: - UITableViewDataSource

extension MusicListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.state.musicList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let music = viewModel.state.musicList[indexPath.row]
        cell.textLabel?.text = music.title
        return cell
    }
    
}
