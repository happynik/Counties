//
//  CitiesListViewModel.swift
//  Cities
//
//  Created by Камилла Бадаева on 18/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift

class CitiesListViewModel {
    // MARK: - Input
    
    // MARK: - Output
    var cities: Observable<[City]>
    
    init() {
        self.cities = .never()
    }
}
