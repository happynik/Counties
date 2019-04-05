//
//  CountryViewController.swift
//  Cities
//
//  Created by Камилла Бадаева on 21/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import UIKit
import RxSwift

class CountryViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var capitalLabel: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!
    @IBOutlet private weak var borderedLabel: UILabel!
    @IBOutlet private weak var currenciesLabel: UILabel!
    
    private let bag = DisposeBag()
    var viewModel: CountryViewModel!
    
    private var test: Observable<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        nameLabel.text = nil
        capitalLabel.text = nil
        populationLabel.text = nil
        borderedLabel.text = nil
        currenciesLabel.text = nil
    }
    
    private func setupBindings() {
        viewModel.country
            .map { $0.name }
            .drive(nameLabel.rx.text)
            .disposed(by: bag)
        
        viewModel.country
            .map { $0.capital }
            .drive(capitalLabel.rx.text)
            .disposed(by: bag)
        
        viewModel.country
            .map { c in c.population.flatMap { "Population: \($0)" } }
            .drive(populationLabel.rx.text)
            .disposed(by: bag)
        
        viewModel.borderedCountries
            .map { countries in
                "Bordered: " + countries.compactMap({ $0.name }).joined(separator: ", ")
            }
            .drive(borderedLabel.rx.text)
            .disposed(by: bag)
        
        viewModel.country
            .map { country in
                country.currencies.flatMap { c in
                    let result = c.compactMap { $0.symbol }
                    if result.isEmpty { return nil }
                    return "Currencies: \(result.joined(separator: ", "))"
                }
            }.drive(currenciesLabel.rx.text)
            .disposed(by: bag)
    }
}
