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

    var viewModel: CountryViewModel!
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        
    }
    
    private func setupBindings() {
        viewModel.title
            .subscribe(onNext: { title in
                self.navigationItem.title = title
            }).disposed(by: bag)
    }
}
