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
    private let bag = DisposeBag()
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let provider = CountriesService(provider: MoyaProvider<CountriesAPI>(plugins: [NetworkLoggerPlugin(verbose: true)]))
        let viewModel = CountriesListViewModel(countriesService: provider)
        let viewController = CountriesListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.viewModel = viewModel
        
        viewModel.showCountry
            .subscribe(onNext: { country in
                print("open country\n\(country)")
            }).disposed(by: bag)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
}
