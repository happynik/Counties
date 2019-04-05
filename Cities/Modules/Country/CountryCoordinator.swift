//
//  CountryCoordinator.swift
//  Cities
//
//  Created by Камилла Бадаева on 21/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Moya

class CountryCoordinator: Coordinator<Void> {
    private let navigationController: UINavigationController
    private let country: Country
    
    init(country: Country, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.country = country
    }
    
    override func start() -> Observable<Void> {
        let provider = MoyaProvider<CountriesAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
        let viewModel = CountryViewModel(country: country, countriesService: CountriesService(provider: provider))
        let viewController = CountryViewController()
        navigationController.pushViewController(viewController, animated: true)
        
        viewController.viewModel = viewModel
        
        return .never()
    }
}
