//
//  CountriesListCoordinator.swift
//  Cities
//
//  Created by Камилла Бадаева on 18/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class CountriesListCoordinator: Coordinator<Void> {
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let provider = MoyaProvider<CountriesAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
        let viewModel = CountriesListViewModel(countriesService: CountriesService(provider: provider))
        let viewController = CountriesListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.viewModel = viewModel
        
        viewModel.showCountry
            .subscribe(onNext: { [unowned self] country in
                print("open country\n\(country)")
                _ = self.show(country: country, in: navigationController)
            }).disposed(by: bag)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
    
    private func show(country: Country, in navigationController: UINavigationController) -> Observable<Void> {
        let countryCoordinator = CountryCoordinator(country: country, navigationController: navigationController)
        return coordinate(to: countryCoordinator)
    }
}
