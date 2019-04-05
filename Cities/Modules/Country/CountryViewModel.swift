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
    
    // MARK: - Input
    
    // MARK: - Output
    
    var title: Observable<String>
    
    var country: Observable<Country>
    
    var borderedCountries: Observable<[Country]>
    
    init(country: Country, countriesService: CountriesServiceProtocol) {
        
        self.title = .just(country.name ?? "unknown")
        self.country = .just(country)
        self.borderedCountries = countriesService.list(of: country.borders ?? []).asObservable()
    }
}
