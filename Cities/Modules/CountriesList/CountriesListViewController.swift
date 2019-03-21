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
        tableView.register(UINib(nibName: CountryCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CountryCell.reuseIdentifier)
        tableView.dataSource = nil
    }
    
    private func setupBindings() {
        viewModel?.countries
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: CountryCell.reuseIdentifier, cellType: CountryCell.self)) { (_, country, cell) in
                cell.fill(from: country)
            }.disposed(by: bag)
    }
}

extension CountryCell {
    func fill(from country: Country) {
        name.text = country.name
        
        popuation.text = country.population
            .flatMap({ $0.presentString })
            .flatMap({ "population: \($0)" }) ?? "unknown"
    }
}

extension Int {
    var presentString: String? {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter.string(for: self)
    }
}
