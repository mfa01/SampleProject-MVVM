//
//  HomeViewController.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = HomeViewModel()
    var presentation = HomeViewPresentation()
    
    override func viewDidLoad() {
        //inherit functunality of parent viewdidload
        super.viewDidLoad()
        viewModel.fetchData()
    }
    
    override func addStateHandlers() {
        viewModel.addChangeHandler { [weak self] changeSignal in
            guard let self = self else {
                return
            }            
            switch changeSignal {
            case .loading:
                self.showLoadingView()
                print("loading")
            case .loaded:
                self.hideLoadingView()
                self.presentation.update(state: self.viewModel.state)
                self.updateUI()
                print("loaded")
            case .failed(let error):
                print("Error: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    override func updateUI() {
        tableView.reloadData()
    }
    
    override func applyStyling() {
        
    }
    
    override func configureViews() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: SongTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentation.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: presentation.rows[indexPath.row].identifier) as? SongTableViewCell
        cell?.presentation = presentation.rows[indexPath.row].presentation as? SongTableViewPresentation
        return cell ?? UITableViewCell()
    }
}
