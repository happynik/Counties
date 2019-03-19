//
//  CitiesListViewController.swift
//  Cities
//
//  Created by Камилла Бадаева on 18/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CitiesListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    
    var viewModel: CitiesListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        
    }
    
    private func setupBindings() {
        viewModel?.cities
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "RepositoryCell", cellType: UITableViewCell.self)) { [weak self] (_, repo, cell) in
//                self?.setupRepositoryCell(cell, repository: repo)
        }.disposed(by: bag)
    }
}
