//
//  CountriesListViewController.swift
//  Cities
//
//  Created by Камилла Бадаева on 18/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CountriesListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    
    var viewModel: CountriesListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
//        tableView.register(UINib(nibName: CountryCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CountryCell.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = nil
    }
    
    private func setupBindings() {
        viewModel?.countries
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (_, country, cell) in
                cell.textLabel?.text = country.name
//                cell.fill(from: country)
            }.disposed(by: bag)
    }
}

extension CountryCell {
    func fill(from country: Country) {
        self.name.text = country.name
    }
}
