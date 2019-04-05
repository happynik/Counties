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
    
//    private var test: Observable<String>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        
    }
    
    private func setupBindings() {
        viewModel.country
            .observeOn(MainScheduler.instance)
            .map { $0.name }
            .bind(to: nameLabel.rx.text)
            .disposed(by: bag)
        
        viewModel.country
            .observeOn(MainScheduler.instance)
            .map { $0.capital }
            .bind(to: capitalLabel.rx.text)
            .disposed(by: bag)
        
        viewModel.borderedCountries
            .observeOn(MainScheduler.instance)
            .map { countries in
                countries.compactMap { $0.name }
                    .joined(separator: ",")
            }
            .subscribe(onNext: { (str) in
                print(str)
            }, onError: { (er) in
                print(er)
            }, onCompleted: {
                print("comp")
            }, onDisposed: {
                print("disp")
            })
//            .bind(to: borderedLabel.rx.text)
            .disposed(by: bag)
    }
}
