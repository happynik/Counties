//
//  CountryViewModel.swift
//  Cities
//
//  Created by Камилла Бадаева on 21/03/2019.
//  Copyright © 2019 Nikita Moiseev. All rights reserved.
//

import Foundation
import RxSwift

class CountryViewModel {
    private let country: Country
    
    // MARK: - Input
    
    // MARK: - Output
    
    var title: Observable<String>
    
    init(country: Country) {
        self.country = country
        
        title = Observable.just(self.country.name ?? "unknown")
    }
}
