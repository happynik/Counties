//
//  CitiesListCoordinator.swift
//  Cities
//
//  Created by Камилла Бадаева on 18/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift

class CitiesListCoordinator: Coordinator<Void> {
    private let bag = DisposeBag()
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let viewModel = CitiesListViewModel()
        let viewController = CitiesListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.viewModel = viewModel
        
//        viewModel.showRepository
//            .subscribe(onNext: { [weak self] in self?.showRepository(by: $0, in: navigationController) })
//            .disposed(by: disposeBag)

//        viewModel.showLanguageList
//            .flatMap { [weak self] _ -> Observable<String?> in
//                guard let `self` = self else { return .empty() }
//                return self.showLanguageList(on: viewController)
//            }
//            .filter { $0 != nil }
//            .map { $0! }
//            .bind(to: viewModel.setCurrentLanguage)
//            .disposed(by: disposeBag)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
}
