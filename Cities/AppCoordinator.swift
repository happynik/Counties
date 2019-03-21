//
//  AppCoordinator.swift
//  Cities
//
//  Created by Камилла Бадаева on 18/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AppCoordinator: Coordinator<Void> {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let citiesListCoordinator = CountriesListCoordinator(window: window)
        return coordinate(to: citiesListCoordinator)
    }
}
